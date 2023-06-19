#!/usr/bin/env bash
set -Eeuo pipefail

declare -A aliases=(
	[8.2]='8 latest'
)
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

	if ! fullVersion="$(jq -er '.[env.version] | if . then .version else empty end' versions.json)"; then
		continue
	fi
	# if [  "$version" != "8.1" ]; then
	# 	continue
	# fi
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
<<<<<<< HEAD
		alpineVer="${suite#alpine}"  # "3.12", etc
		tags="littleof/php:$fullVersion-$variant-$suite"
		shortTags="littleof/php:$fullVersion-$variant"
		versionTags="littleof/php:$fullVersion"
		shortversionTags="littleof/php:$fullVersion"
		echo build $tags
		docker build -t $tags -f "$version/$dir/"Dockerfile ./"$version/$dir/"
		docker push $tags
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 3faf28cf (up)
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
		if [[ "$variant" == "cli" ]] && [[ "$suite" == "bullseye" ]]; then
			docker tag $tags $shortTags
			docker push $shortTags
			docker push $versionTags-$variant
			docker tag $tags littleof/php:$version-$variant
		fi
<<<<<<< HEAD
		if [[ "$version" == "8.1" ]] && [[ "$variant" == "cli" ]] && [[ "$suite" == "bullseye" ]]; then
=======
		if [[ "$version" == "8.2" ]] && [[ "$variant" == "cli" ]] && [[ "$suite" == "bullseye" ]]; then
>>>>>>> 3faf28cf (up)
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
<<<<<<< HEAD
=======
		# if [[ "$version" == "7.4" ]] && [[ "$variant" == "cli" ]] && [[ "$suite" == "bullseye" ]]; then
		# 	docker tag $tags $shortTags
		# 	docker push $shortTags
		# 	docker tag $tags $versionTags
		# 	docker push $versionTags
		# 	docker tag $tags littleof/php:$version
		# 	docker push littleof/php:$version
		# 	docker tag $tags littleof/php:7
		# 	docker push littleof/php:7
		# fi
		# if [[ "$variant" == "cli" ]] && [[ "$suite" == "bullseye" ]]; then
		# 	docker tag $tags $shortTags
		# 	docker push $shortTags
		# 	docker push $versionTags-$variant
		# 	docker tag $tags littleof/php:$version-$variant
		# fi
		# if [[ "$version" == "8.2" ]] && [[ "$variant" == "cli" ]] && [[ "$suite" == "bullseye" ]]; then
		# 	docker tag $tags $shortTags
		# 	docker push $shortTags
		# 	docker tag $tags $versionTags
		# 	docker push $versionTags
		# 	docker tag $tags littleof/php:$version
		# 	docker push littleof/php:$version
		# 	docker tag $tags littleof/php:8
		# 	docker push littleof/php:8
		# 	docker tag $tags littleof/php:latest
		# 	docker push littleof/php:latest
		# fi
>>>>>>> e93d3047 (fix: swoole build error)
=======
>>>>>>> 3faf28cf (up)
=======
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
			echo build "$NAMESPACE/php:$ver"
			docker build -t "$NAMESPACE/php:$ver" -f "$dir/"Dockerfile ./"$dir"
			docker tag "$NAMESPACE/php:$ver" "$HOST/$NAMESPACE/php:$ver"
			docker push "$HOST/$NAMESPACE/php:$ver"
			docker image ls
		}
		done
<<<<<<< HEAD
		# echo  $(join ', ' "${variantAliases[@]}")
		wait
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 2549d2b2 (up)
=======
	}&
>>>>>>> 58413dc3 (up)
=======
=======
		echo  $(join ', ' "${variantAliases[@]}")
>>>>>>> 3527f237 (feat: 优化构建)
	}
	# &
>>>>>>> 7a6e3eed (feat: docker login)
=======
	}&
>>>>>>> da7cf35b (up)
=======
	}
>>>>>>> cf9523ad (up)
=======
	}&
>>>>>>> 47c52ab7 (feat:ci)
=======
	}
>>>>>>> 51ad4bed (fix: 优化构建)
	done
}&
done
wait
