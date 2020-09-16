#!/bin/sh -l

REF="${1#refs/}"
BRANCH_NAME="${REF#heads/}"
TAG_NAME="${REF#tags/}"

if [[ $BRANCH_NAME == master ]]; then
  BRANCH_TAG=latest
elif [[ $TAG_NAME != $REF ]]; then
  BRANCH_TAG=$TAG_NAME
else
  BRANCH_TAG="${BRANCH_NAME//\//-}"
fi

echo "::set-env name=BRANCH_TAG::$BRANCH_TAG"
echo "::set-output name=branch_tag::$BRANCH_TAG"
