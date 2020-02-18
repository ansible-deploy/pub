<h2>Deploy terraform + aws + ansible + nginx (443,80) > HELLO WORLD!</h2>
<h3>ВНИМАНИЕ! Перед началом тестирования необходимо сделать бэкап директории /etc/ansible/</h3>
<dl>
<dt>Для тестирования необходимо:</dt>
1. Установить CentOS Linux release 7 (Core) на вашу ВМ;<br>
2. Отключить selinux и/или остановить/удалить firewalld;<br>
3. Установить репозиторий yum -y install epel-release;<br>
4. Установить yum install -y ansible 2.9.3-1.el7;<br>
5. Установить yum install -y git 1.8.3.1-21.el7_7;<br>
6. Установить yum install -y curl 7.29.0-54.el7_7.2;<br>
7. Установить yum install -y unzip.x86_64 0:6.0-20.el7;<br>
8. Установить yum install -y wget.x86_64 0:1.14-18.el7_6.1;<br>
<dt>Примечание*</dt>
	Установка terraform требуется дальше по инструкции, весь нужный софт должен находится в папке ansible.<br>
	Все действия выполнять от пользователя root<br>
<dt>Разворачиваем инстанс:</dt>
1. Переходим в папку /var/tmp для копирования репозитория:<br>
	cd /var/tmp/<br>
2. Копируем репозиторий:<br>
	git clone https://github.com/ansible-deploy/public.git<br>
3. Копируем папку "ansible" с заменой всех файлов в /etc:<br>
	cp -r ansible/ /etc/<br>
4. Переходим в папку /etc/ansible/<br>
	cd /etc/ansible<br>
5. Скачиваем terraform_0.12.20_linux_amd64.zip в /etc/ansible:<br>
	wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip<br>
6. Разархивируем скаченный дистрибутив:<br>
	unzip terraform_0.12.20_linux_amd64.zip<br>
7. Выдаем права на выполнение скриптов:<br>
	chmod 777 public_ip_dns.sh start.sh stop.sh<br>
8. Открываем вторую консоль, для просмотра лога:<br> 
Вставляем команду<br>
	tail -f /etc/ansible/deploy.log<br>
9. Запускаем скрипт:<br>
	/etc/ansible/start.sh<br> 
10. Ждем указаний автоответчика из лога.<br>
11. Смотрим адрес инстанса:<br>
	cat /etc/ansible/public_ip<br>
12. Получаем ответ от сервера вручную на 80 и 443 порты:<br>
	curl -Lv айписервера<br>
	curl -k https://айписервера<br>
<dt>Удаляем инстанс:</dt>
1. Запускаем скрипт:<br>
	/etc/ansible/stop.sh<br>
2. Смотрим в лог:<br>
	tail -f /etc/ansible/deploy.log<br>
P.S.<br>
	Максимально автоматизировал и упростил разворот инстанса.<br>
	Спасибо за внимание.<br>
</dl>	
