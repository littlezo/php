#!/usr/bin/env bash

OWNER="littlezo"
REPO="php"
PACKAGE_NAME="php"
TOKEN= ${{ secrets.GITHUB_TOKEN }}
# TOKEN="$GITHUB_TOKEN"
# echo $TOKEN
# 获取所有未标记的版本
untagged_versions=$(curl -H "Authorization: bearer $TOKEN" -H "Accept: application/vnd.github.v3+json" \
"https://api.github.com/user/packages/container/php/versions?per_page=200" | jq -r '.[] | select(.metadata.container.tags | length == 0) | .id')

#  | jq -r '.[] | select(.metadata.container.tags | length == 0) | .id')
echo $untagged_versions
# 循环删除每个未标记的版本
for version in $untagged_versions
do
{
  echo "Deleting version $version"
  curl -X DELETE -H "Authorization: bearer $TOKEN" -H "Accept: application/vnd.github.v3+json" \
  "https://api.github.com/user/packages/container/php/versions/$version"
}&
done
wait