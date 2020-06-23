#!/bin/bash
yum install -y aws-cli
aws s3 cp s3://fsilvestre-flask-app/ecs.config /etc/ecs/ecs.config
