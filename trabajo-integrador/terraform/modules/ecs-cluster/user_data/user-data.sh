#!/bin/bash

cd /home
cd ec2-user
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
yum -y install unzip
unzip awscliv2.zip
sudo ./aws/install
yum -y install wget

mkdir cert
cd cert
aws s3 cp s3://aiouti-lf/certs/certificate.cert.pem certificate.cert.pem
aws s3 cp s3://aiouti-lf/certs/certificate.public.key certificate.public.key
aws s3 cp s3://aiouti-lf/certs/certificate.private.key certificate.private.key
wget https://www.amazontrust.com/repository/AmazonRootCA1.pem
mv AmazonRootCA1.pem certificate.root.pem

# ECS config
{
  echo "ECS_CLUSTER=${cluster_name}"
} >> /etc/ecs/ecs.config

start ecs

echo "Done"
