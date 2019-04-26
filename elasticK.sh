#!/bin/bash


yum update

echo "[elastic_stack-6.x]
name=Elastic Stack repository for 6.x packages
baseurl=https://artifacts.elastic.co/packages/6.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md" > /etc/yum.repos.d/elastic_stack.repo


echo "about to install javajdk....."
yum install java-1.8.0-openjdk -y


echo "Installing elasticsearch, enabling and starting"
yum install elasticsearch -y

sudo systemctl daemon-reload
sudo systemctl enable elasticsearch.service
systemctl start elasticsearch

echo "Testing elasticsearch on localhost port 9200...."
echo "#####################Testing Elasticsearch######################
#
######################################################################"
curl localhost:9200
echo
echo " ######################End of Test###############################"

yum install kibana -y

systemctl enable kibana
systemctl start kibana


echo "Now exit your current ssh session and run the following to enable port forwarding on your local
machine"
echo
echo

echo "###################################################################################################

fill in the appropriate info and run this command ----> ssh <user_name>@<ip_addr> -L 5601:localhost:5601


##########################################################################################################"
