#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export DD_DISCOUNTS_URL=https://[[HOST_SUBDOMAIN]]-5001-[[KATACODA_HOST]].environments.katacoda.com/discount

cd /ecommworkshop
git fetch
git checkout tags/2.0.0

statusupdate files

sed -i 's/--input-file requests_0.gor/--input-file "requests_0.gor|300%"/g' ./traffic-replay/Dockerfile
#sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./ads-service/requirements.txt
#sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./ads-service-fixed/requirements.txt
#sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./discounts-service-fixed/requirements.txt
#sed -i 's/ddtrace==0.28.0/ddtrace==0.41.0/g' ./discounts-service/requirements.txt
#cp /root/frontend-docker-entrypoint.sh ./store-frontend-instrumented-fixed/docker-entrypoint.sh
#cp /root/frontend-docker-entrypoint.sh ./store-frontend-broken-instrumented/docker-entrypoint.sh

cd /ecommworkshop/deploy/docker-compose
#docker-compose -f docker-compose-fixed.yml up -d
#docker-compose -f docker-compose-broken.yml up -d
#docker-compose -f docker-compose-slow.yml up -d

#envready

statusupdate complete

#prepenvironment