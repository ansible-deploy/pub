  
  ![image](https://user-images.githubusercontent.com/61209290/76253530-6bf6ec80-627d-11ea-9fe8-173a50656696.png)
  <h3>Простой сервер идентификационных пиктограмм на основе программы monsterid Кевина Годена.</h3>
  docker-compose build<br>
  docker-compose up -d<br>
  docker ps -a<br>
  docker logs identidock_$<br>
  http://ip_address:5000/<br>
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)<br>
