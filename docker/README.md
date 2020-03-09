  
  docker-compose build<br>
  docker-compose up -d<br>
  docker ps -a<br>
  docker logs identidock_$<br>
  http://ip_address:5000/<br>
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)<br>
