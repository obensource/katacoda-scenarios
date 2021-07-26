#!/bin/bash

export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres

statuscheck files

cd /ecommworkshop
rm -r ./store-frontend-instrumented-fixed
rm -r ./store-frontend-broken-instrumented
rm -r ./ads-service
rm -r ./ads-service-fixed
rm -r ./discounts-service
rm -r ./discounts-service-fixed

git fetch
git checkout ccf7325 ./store-frontend-instrumented-fixed
git checkout ccf7325 ./store-frontend-broken-instrumented
git checkout ccf7325 ./ads-service
git checkout ccf7325 ./ads-service-fixed
git checkout ccf7325 ./discounts-service
git checkout ccf7325 ./discounts-service-fixed
git checkout ccf7325 ./traffic-replay

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