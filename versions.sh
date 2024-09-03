#!/usr/bin/env bash
set -Eeuo pipefail
rm -rf 8.{1,2,3,4}-rc
mkdir 8.{1,2,3,4}-rc
cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=("$@")
if [ ${#versions[@]} -eq 0 ]; then
	versions=(*/)
	json='{}'
else
	json="$(<versions.json)"
fi
versions=("${versions[@]%/}")

for version in "${versions[@]}"; do
	rcVersion="${version%-rc}"
	export version rcVersion

	# scrape the relevant API based on whether we're looking for pre-releases
	if [ "$rcVersion" = "$version" ]; then
		apiUrl="https://www.php.net/releases/index.php?json&max=100&version=${rcVersion%%.*}"
		apiJqExpr='
			(keys[] | select(startswith(env.rcVersion))) as $version
			| [ $version, (
				.[$version].source[]
				| select(.filename | endswith(".xz"))
				|
					"https://www.php.net/distributions/" + .filename,
					"https://www.php.net/distributions/" + .filename + ".asc",
					.sha256 // ""
			) ]
		'
	else
		apiUrl='https://qa.php.net/api.php?type=qa-releases&format=json'
		apiJqExpr='
			(.releases // [])[]
			| select(.version | startswith(env.rcVersion))
			| [
				.version,
				.files.xz.path // "",
				"",
				.files.xz.sha256 // ""
			]
		'
	fi
	IFS=$'\n'
	possibles=($(
		curl -fsSL "$apiUrl" |
			jq --raw-output "$apiJqExpr | @sh" |
			sort -rV
	))
	unset IFS
	if [ "${#possibles[@]}" -eq 0 ]; then
		if [ "$rcVersion" = "$version" ]; then
			echo >&2
			echo >&2 "error: unable to determine available releases of $version"
			echo >&2
			continue
			# exit 1
		else
			echo >&2 "warning: skipping/removing '$version' (does not appear to exist upstream)"
			json="$(jq <<<"$json" -c '.[env.version] = null')"
			continue
		fi
	fi

	# format of "possibles" array entries is "VERSION URL.TAR.XZ URL.TAR.XZ.ASC SHA256" (each value shell quoted)
	#   see the "apiJqExpr" values above for more details
	eval "possi=( ${possibles[0]} )"
	fullVersion="${possi[0]}"
	url="${possi[1]}"
	ascUrl="${possi[2]}"
	sha256="${possi[3]}"

	if ! wget -q --spider "$url"; then
		echo >&2 "error: '$url' appears to be missing"
		continue
	fi

	# if we don't have a .asc URL, let's see if we can figure one out :)
	if [ -z "$ascUrl" ] && wget -q --spider "$url.asc"; then
		ascUrl="$url.asc"
	fi

	variants='[]'
	# order here controls the order of the library/ file
	for suite in \
		bookworm \
		bullseye \
		alpine3.20 \
		alpine3.19 \
	; do
		for variant in cli swoole zts swow; do
			# if [[ "$version" == "8.0" && !("$suite" == "bullseye" || "$suite" == "alpine3.16") ]]; then
			# 	echo "Skipping $version $suite"
			# 	continue
			# fi
			# if [[ "$version" != "8.0" &&  "$suite" == "alpine3.16" ]]; then
			# 	echo "Skipping $version $suite"
			# 	continue
			# fi
			export suite variant
			variants="$(jq <<<"$variants" -c '. + [ env.suite + "/" + env.variant ]')"
		done
	done

	echo "$version: $fullVersion"
	if ! grep -q "^$version=" .env.current.version; then
		echo "$version=$fullVersion" >> .env.current.version
	else
		if [ "$(uname)" == 'Darwin' ]; then
			# Mac OS X 操作系统
			sed -i '' "s/\($version=[^ ]*\)/$version=$fullVersion/" .env.current.version
		else
			# GNU/Linux操作系统
			sed -i "s/\($version=[^ ]*\)/$version=$fullVersion/" .env.current.version
		fi
	fi
	export fullVersion url ascUrl sha256
	json="$(
		jq <<<"$json" -c --argjson variants "$variants" '
			.[env.version] = {
				version: env.fullVersion,
				url: env.url,
				ascUrl: env.ascUrl,
				sha256: env.sha256,
				variants: $variants,
			}
		'
	)"

	if [ "$version" = "$rcVersion" ]; then
		json="$(jq <<<"$json" -c '
			.[env.version + "-rc"] //= null
		')"
	fi
done

jq <<<"$json" -S . >versions.json
