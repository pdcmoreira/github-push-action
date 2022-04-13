#!/bin/sh
echo "Push to branch ${INPUT_BRANCH:=master}";
[ -z "${INPUT_GITHUB_TOKEN}" ] && {
    echo 'Missing input "github_token: ${{ secrets.GITHUB_TOKEN }}".';
    exit 1;
};

header=$(echo -n "ad-m:${INPUT_GITHUB_TOKEN}" | base64)
git config --global --add safe.directory /github/workspace
git -c http.extraheader="AUTHORIZATION: basic $header" push origin HEAD:${INPUT_BRANCH} --follow-tags;
