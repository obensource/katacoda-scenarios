#!/bin/bash

curl -s https://datadoghq.dev/katacodalabtools/r?raw=true|bash

statuscheck files

mv /root/docker-compose-fixed.yml /ecommworkshop/deploy/docker-compose/
mv /root/docker-compose-broken.yml /ecommworkshop/deploy/docker-compose/
mv /root/docker-compose-slow.yml /ecommworkshop/deploy/docker-compose/


# Fetch discounts in the browser
cp /root/home_controller.rb /ecommworkshop/store-frontend-instrumented-fixed/app/controllers/spree/home_controller.rb
mv /root/home_controller.rb /ecommworkshop/store-frontend-broken-instrumented/app/controllers/spree/home_controller.rb

cp /root/spree_application.html.erb /ecommworkshop/store-frontend-instrumented-fixed/app/views/spree/layouts/spree_application.html.erb
mv /root/spree_application.html.erb /ecommworkshop/store-frontend-broken-instrumented/app/views/spree/layouts/spree_application.html.erb

cp /root/index.html.erb /ecommworkshop/store-frontend-broken-instrumented/app/views/spree/home/index.html.erb
mv /root/index.html.erb /ecommworkshop/store-frontend-instrumented-fixed/app/views/spree/home/index.html.erb

cp /root/discounts.py /ecommworkshop/discounts-service/discounts.py
mv /root/discounts-requirements.txt /ecommworkshop/discounts-service/requirements.txt

#/ecommworkshop/gor --input-file-loop --input-file "/ecommworkshop/requests_0.gor|300%" --output-http "http://localhost:3000" >> /dev/null 2>&1
cd 

node mobile-session-replay.js http://localhost:3000