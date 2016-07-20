#!/bin/bash -e
#
# @license
# Copyright (c) 2014 The Polymer Project Authors. All rights reserved.
# This code may only be used under the BSD style license found at http://polymer.github.io/LICENSE.txt
# The complete set of authors may be found at http://polymer.github.io/AUTHORS.txt
# The complete set of contributors may be found at http://polymer.github.io/CONTRIBUTORS.txt
# Code distributed by Google as part of the polymer project is also
# subject to an additional IP rights grant found at http://polymer.github.io/PATENTS.txt
#

# This script pushes a demo-friendly version of your element and its
# dependencies to gh-pages.

# usage gp Polymer core-item [branch]
# Run in a clean directory passing in a GitHub org and repo name
echo 'Deploy gpages'
org=$1
repo=$2
name="Tianxiang Zhang"
email="cenhiangapply@gmail.com"
branch=${3:-"release"} # default to release when branch isn't specified

rm -rf temp
mkdir temp && cd temp
mkdir $repo
git clone "https://${org}:${GH_TOKEN}@github.com/${org}/${repo}" --single-branch

# switch to gh-pages branch
pushd $repo >/dev/null
git checkout --orphan gh-pages

# remove all content
echo 'Remove all content'
git rm -rf -q .

# use bower to install runtime deployment
bower cache clean $repo # ensure we're getting the latest from the desired branch.
git show ${branch}:bower.json > bower.json
echo "{
  \"directory\": \"components\"
}
" > .bowerrc
bower install
bower install $org/$repo#$branch
git checkout ${branch} -- demo
rm -rf components/$repo/demo
mv demo components/$repo/

# redirect by default to the component folder
echo "<META http-equiv="refresh" content=\"0;URL=components/$repo/\">" >index.html

git config user.name $name
git config user.email $email
# send it all to github
git add -A .
git commit -am 'Deploy to Github Pages'
git push --force --quiet -u "https://${org}:${GH_TOKEN}@github.com/${org}/${repo}" gh-pages > /dev/null 2>&1

popd >/dev/null
rm -rf temp
