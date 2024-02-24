#!/bin/bash

sudo yum update -y
sudo yum install git wget httpd -y 
sudo systemctl start httpd
sudo systemctl enable httpd
sudo yum install unzip -y 
wget https://github.com/utrains/static-resume/archive/refs/heads/main.zip
unzip main.zip