#!/usr/bin/env bash
set -Eeuo pipefail

declare -A aliases=(
	[8.3]='8 latest'
)

echo $ACR_NAMESPACE
echo $GH_NAMESPACE
cat ~/.docker/config.json
var_when=${1:-null}
self="$(basename "$BASH_SOURCE")"
cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"
if [ "$#" -eq 0 ]; then
	versions="$(jq -r 'to_entries | map(if .value then .key | @sh else empty end) | join(" ")' versions.json)"
	eval "set -- $versions"
fi

join() {
	local sep="$1"; shift
	local out; printf -v out "${sep//%/%%}%s" "$@"
	echo "${out#$sep}"
}

for version; do
{
	rcVersion="${version%-rc}"
	export version rcVersion
	if [[ "$var_when" != "null" && "$version" != "$var_when" ]]; then
		echo "Version mismatch. Exiting..."
		exit 1
	fi
	if ! fullVersion="$(jq -er '.[env.version] | if . then .version else empty end' versions.json)"; then
		continue
	fi
	if [ "$rcVersion" != "$version" ] && rcFullVersion="$(jq -er '.[env.rcVersion] | if . then .version else empty end' versions.json)"; then
		# if this is a "-rc" release, let's make sure the release it contains isn't already GA (and thus something we should not publish anymore)
		latestVersion="$({ echo "$fullVersion"; echo "$rcFullVersion"; } | sort -V | tail -1)"
		if [[ "$fullVersion" == "$rcFullVersion"* ]] || [ "$latestVersion" = "$rcFullVersion" ]; then
			# "x.y.z-rc1" == x.y.z*
			continue
		fi
	fi

	variants="$(jq -r '.[env.version].variants | map(@sh) | join(" ")' versions.json)"
	eval "variants=( $variants )"

	versionAliases=(
		$fullVersion
		$version
		${aliases[$version]:-}
	)

	defaultDebianVariant="$(jq -r '
		.[env.version].variants
		| map(
			split("/")[0]
			| select(
				startswith("alpine")
				| not
			)
		)
		| .[0]
	' versions.json)"
	defaultAlpineVariant="$(jq -r '
		.[env.version].variants
		| map(
			split("/")[0]
			| select(
				startswith("alpine")
			)
		)
		| .[0]
	' versions.json)"

	for dir in "${variants[@]}"; do
	{
		suite="$(dirname "$dir")" # "buster", etc
		variant="$(basename "$dir")" # "cli", etc
		dir="$version/$dir"
		[ -f "$dir/Dockerfile" ] || continue

		variantAliases=( "${versionAliases[@]/%/-$variant}" )
		variantAliases=( "${variantAliases[@]//latest-/}" )

		if [ "$variant" = 'cli' ]; then
			variantAliases+=( "${versionAliases[@]}" )
		fi

		suiteVariantAliases=( "${variantAliases[@]/%/-$suite}" )
		if [ "$suite" = "$defaultAlpineVariant" ] ; then
			variantAliases=( "${variantAliases[@]/%/-alpine}" )
		elif [ "$suite" != "$defaultDebianVariant" ]; then
			variantAliases=()
		fi
		variantAliases=( "${suiteVariantAliases[@]}" ${variantAliases[@]+"${variantAliases[@]}"} )
		variantAliases=( "${variantAliases[@]//latest-/}" )

		variantParent="$(awk 'toupper($1) == "FROM" { print $2 }' "$dir/Dockerfile")"
		# variantArches="${parentRepoToArches[$variantParent]}"
		for ver in ${variantAliases[@]}; do
		{
			IMAGE="php:$ver"
			echo build $IMAGE
			docker build -t $IMAGE -f "$dir/"Dockerfile ./"$dir"
			docker tag $IMAGE "$ACR_REGISTRY/$ACR_NAMESPACE/php:$ver"
			docker push "$ACR_REGISTRY/$ACR_NAMESPACE/php:$ver"
			docker tag $IMAGE "$GH_REGISTRY/$GH_NAMESPACE/php:$ver"
			docker push "$GH_REGISTRY/$GH_NAMESPACE/php:$ver"
		}
		done
		echo  $(join ', ' "${variantAliases[@]}")
	}
	done
}&
done
wait
docker image ls
