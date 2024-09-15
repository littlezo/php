#!/usr/bin/env bash
set -Eeuo pipefail

[ -f versions.json ] # run "versions.sh" first

jqt='.jq-template.awk'
if [ -n "${BASHBREW_SCRIPTS:-}" ]; then
	jqt="$BASHBREW_SCRIPTS/jq-template.awk"
elif [ "$BASH_SOURCE" -nt "$jqt" ]; then
	# https://github.com/docker-library/bashbrew/blob/master/scripts/jq-template.awk
	wget -qO "$jqt" 'https://raw.githubusercontent.com/docker-library/bashbrew/master/scripts/jq-template.awk'
fi

if [ "$#" -eq 0 ]; then
	versions="$(jq -r 'keys | map(@sh) | join(" ")' versions.json)"
	eval "set -- $versions"
fi

generated_warning() {
	cat <<-EOH
		#
		# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
		#
		# PLEASE DO NOT EDIT IT DIRECTLY.
		#

	EOH
}

for version; do
	export version
	if [ -d $version ]; then
		rm -rf "$version"
    # echo "文件夹存在"
	fi

	if jq -e '.[env.version] | not' versions.json >/dev/null; then
		echo "deleting $version ..."
		continue
	fi

	variants="$(jq -r '.[env.version].variants | map(@sh) | join(" ")' versions.json)"
	eval "variants=( $variants )"

	for dir in "${variants[@]}"; do
		suite="$(dirname "$dir")"    # "buster", etc
		variant="$(basename "$dir")" # "cli", etc
		export suite variant

		alpineVer="${suite#alpine}" # "3.12", etc
		if [ "$suite" != "$alpineVer" ]; then
			from="alpine:$alpineVer"
		else
			from="debian:$suite-slim"
		fi
		export from alpineVer

		case "$variant" in
		*) cmd='["php", "-a"]' ;;
		esac
		export cmd

		echo "processing $version/$dir ..."
		mkdir -p "$version/$dir"
		echo "$version/$dir"
		echo $jqt
		{
			generated_warning
			gawk -f "$jqt" 'Dockerfile-linux.template'
		} >"$version/$dir/Dockerfile"

		cp -a \
			docker-php-entrypoint \
			docker-php-ext-* \
			docker-php-source \
			"$version/$dir/"

		cmd="$(jq <<<"$cmd" -r '.[0]')"
		if [ "$cmd" != 'php' ]; then
			sed -i -e 's! php ! '"$cmd"' !g' "$version/$dir/docker-php-entrypoint"
		fi
	done
done
