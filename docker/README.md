  <h2>Simple identicon server based on monsterid from Kevin Gaudin.</h2>
  <h2>From "Using Docker" by Adrian Mouat published by O'Reilly Media.</h2>
  docker-compose build<br>
  docker-compose up -d<br>
  docker ps -a<br>
  docker logs identidock_$<br>
  http://ip_address:5000/<br>
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)<br>
