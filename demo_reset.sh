#!/usr/bin/env bash

rm -rf src/main/webapp/index.html
mv index-orig.html src/main/webapp/index.html

sed -E -i "s:v[0-9]+\.[0-9]+\.[0-9]+:$1:" src/main/webapp/index.html
sed -E -i "s:pkg_version=[0-9]+\.[0-9]+\.[0-9]+:pkg_version=$1:" habitat/plan.sh
sed -E -i "s:v[0-9]+\.[0-0]+\.[0-9]+:$2:" red-index.html

git add .
git commit -m "Demo reset and rev"
git push origin master
