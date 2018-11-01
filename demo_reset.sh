#!/usr/bin/env bash

if [[ $1 =~ ^[0-9]+\.[0-9]+\.[0-9]+ ]]; then
  echo 
else
  echo "Invalid version"
  exit
fi

if [[ $2 =~ ^[0-9]+\.[0-9]+\.[0-9]+ ]]; then
  echo 
else
  echo "Invalid version"
  exit
fi

rm -rf src/main/webapp/index.html
mv index-orig.html src/main/webapp/index.html

sed -E -i "s:v[0-9]+\.[0-9]+\.[0-9]+:v$1:" src/main/webapp/index.html
sed -E -i "s:pkg_version=[0-9]+\.[0-9]+\.[0-9]+:pkg_version=$1:" habitat/plan.sh
sed -E -i "s:v[0-9]+\.[0-9]+\.[0-9]+:v$2:" red-index.html

git add .
git commit -m "Demo reset and rev"
git push origin master
