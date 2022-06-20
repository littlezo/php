#!/usr/bin/env bash
set -Eeuo pipefail

[ -f versions.json ] # run "versions.sh" first

if [ "$#" -eq 0 ]; then
	versions="$(jq -r 'keys | map(@sh) | join(" ")' versions.json)"
	eval "set -- $versions"
fi

for version; do
	export version
	variants="$(jq -r '.[env.version].variants | map(@sh) | join(" ")' versions.json)"
	fullVersion="$(jq -r '.[env.version].version' versions.json)"
	eval "variants=( $variants )"
	eval "fullVersion=( $fullVersion )"
	for dir in "${variants[@]}"; do
		suite="$(dirname "$dir")"    # "buster", etc
		variant="$(basename "$dir")" # "cli", etc
		alpineVer="${suite#alpine}"  # "3.12", etc
		tags="littleof/php:$fullVersion-$variant-$suite"
		shortTags="littleof/php:$fullVersion-$variant"
		versionTags="littleof/php:$fullVersion"
		shortversionTags="littleof/php:$fullVersion"
		echo build $tags
		docker build -t $tags -f "$version/$dir/"Dockerfile ./"$version/$dir/"
		docker push $tags
		if [[ "$version" == "7.4" ]] && [[ "$variant" == "cli" ]] && [[ "$suite" == "bullseye" ]]; then
			docker tag $tags $shortTags
			docker push $shortTags
			docker tag $tags $versionTags
			docker push $versionTags
			docker tag $tags littleof/php:$version
			docker push littleof/php:$version
			docker tag $tags littleof/php:7
			docker push littleof/php:7
		fi
		if [[ "$version" == "8.1" ]] && [[ "$variant" == "cli" ]] && [[ "$suite" == "bullseye" ]]; then
			docker tag $tags $shortTags
			docker push $shortTags
			docker tag $tags $versionTags
			docker push $versionTags
			docker tag $tags littleof/php:$version
			docker push littleof/php:$version
			docker tag $tags littleof/php:8
			docker push littleof/php:8
			docker tag $tags littleof/php:latest
			docker push littleof/php:latest
		fi
	done
done
