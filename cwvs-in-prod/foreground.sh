#!/bin/bash
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export DD_DISCOUNTS_URL=https://[[HOST_SUBDOMAIN]]-5001-[[KATACODA_HOST]].environments.katacoda.com/discount
export DD_ADS_URL=https://[[HOST_SUBDOMAIN]]-5002-[[KATACODA_HOST]].environments.katacoda.com/
export RUM_START_URL=https://[[HOST_SUBDOMAIN]]-3000-[[KATACODA_HOST]].environments.katacoda.com/

clear

statuscheck environment

cd /root/lab

statusupdate complete
prepenvironment