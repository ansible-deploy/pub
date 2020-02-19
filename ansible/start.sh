#!/bin/bash
date >> /etc/ansible/deploy.log
echo "Генерирую ssh_key" >> /etc/ansible/deploy.log 
echo -e 'y\n' | ssh-keygen -b 4098 -f /root/.ssh/terraform -q -N '' -C root@localhost
echo "Перехожу в директорию /var/tmp " >> /etc/ansible/deploy.log
cd /etc/ansible/
echo "Выполняю инициалицию terraform init" >> /etc/ansible/deploy.log
/etc/ansible/terraform init >> /etc/ansible/deploy.log
echo "Разворачиваю истанс" >> /etc/ansible/deploy.log
/etc/ansible/terraform apply -auto-approve >> /etc/ansible/deploy.log
echo "ждем 100 секунд" >> /etc/ansible/deploy.log
sleep 100
echo "Генерирую ip address" >> /etc/ansible/deploy.log
/etc/ansible/public_ip_dns.sh
echo "Ждем 5 секунд" >> /etc/ansible/deploy.log
sleep 5
echo "Нажмите yes для принятия отпечатка" >> /etc/ansible/deploy.log
/usr/bin/ansible ec2-instance -m ping
echo "Подключение до инстанса активно" >> /etc/ansible/deploy.log
sleep 5
echo "Запускаю установку nginx" >> /etc/ansible/deploy.log
/usr/bin/ansible-playbook /etc/ansible/play.yml >> /etc/ansible/deploy.log
echo "Ждем 20 секунд" >> /etc/ansible/deploy.log
sleep 20
echo "Получаю ответ от сервера" >> /etc/ansible/deploy.log
abc=`cat /etc/ansible/public_ip`
echo `/usr/bin/curl $abc`
echo "Разворот инстанса завершен - нажмите CTRL + C" >> /etc/ansible/deploy.log
date >> /etc/ansible/deploy.log
