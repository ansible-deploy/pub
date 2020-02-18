#!/bin/bash
abc=`grep -rn -w 'public_dns' /etc/ansible/terraform.tfstate | awk '{print $3}' | tr -d \",`
echo "ec2-instance ansible_host=$abc ansible_user=centos ansible_ssh_private_key_file=/root/.ssh/terraform">/etc/ansible/hosts
grep -rn -w 'public_ip' /etc/ansible/terraform.tfstate | awk '{print $3}' | tr -d \", >/etc/ansible/public_ip


