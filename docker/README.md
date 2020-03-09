  <h3>Простой сервер идентификационных пиктограмм на основе программы monsterid Кевина Годена.</h3>
  [Image alt](https://github.com/ansible-deploy/pub/blob/master/docker/image.png)
  docker-compose build<br>
  docker-compose up -d<br>
  docker ps -a<br>
  docker logs identidock_$<br>
  http://ip_address:5000/<br>
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)<br>
