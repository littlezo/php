#!/usr/bin/env bash

OWNER="littlezo"
REPO="php"
PACKAGE_NAME="php"
TOKEN="$GITHUB_TOKEN"
# 获取所有未标记的版本
untagged_versions=$(curl -H "Authorization: bearer $TOKEN" -H "Accept: application/vnd.github.v3+json" \
"https://api.github.com/user/packages/container/php/versions?per_page=200")

fctch(){
  echo $(curl -H "Authorization: bearer $TOKEN" -H "Accept: application/vnd.github.v3+json" \
"https://api.github.com/user/packages/container/php/versions?per_page=200")
}

remove() {
  untagged_versions=$1
  # 循环删除每个未标记的版本
  for version in $untagged_versions
  do
  {
    echo "Deleting version $version"
    curl -X DELETE -H "Authorization: bearer $TOKEN" -H "Accept: application/vnd.github.v3+json" \
    "https://api.github.com/user/packages/container/php/versions/$version" -o /dev/null
  }&
  done
  wait
}
test(){
  result=$(fctch)
  if [ "$((echo $result) | jq -r '. | type')" == "array" ]; then
      untagged_versions=($((echo $result) | jq -r '.[] | select(.metadata.container.tags | length == 0) | .id'))
      if [ "${#untagged_versions[@]}" -gt 0 ]; then
        remove $untagged_versions
        test
      fi
  fi
}
test