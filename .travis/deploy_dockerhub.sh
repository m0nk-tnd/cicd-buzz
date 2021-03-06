#!/bin/sh
repo=`echo ${TRAVIS_REPO_SLUG} | cut -f 2 -d /`

docker login -u $DOCKER_USER -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t $DOCKER_USER/$repo:$TAG .
docker push $DOCKER_USER/$repo