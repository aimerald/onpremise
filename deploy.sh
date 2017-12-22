#!/bin/bash

mkdir -p data/sentry
mkdir -p data/postgress

export SENTRY_SECRET_KEY=$(docker-compose run --rm web config generate-secret-key)
echo $SENTRY_SECRET_KEY
docker-compose run --rm web upgrade
docker-compose build --no-cache
docker-compose up -d
