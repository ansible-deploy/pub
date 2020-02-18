#!/bin/bash
echo "Удаляю инстанс" >> /etc/ansible/deploy.log
/etc/ansible/terraform destroy -force >> /etc/ansible/deploy.log
echo "Инстанс удален - Нажмите CTRL + C" >> /etc/ansible/deploy.log
