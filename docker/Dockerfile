FROM python:3.4
RUN apt-get update
RUN pip install --upgrade pip
RUN pip install Flask 
RUN pip install uWSGI
RUN pip install requests==2.5.1
RUN pip install redis==2.10.3
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
WORKDIR /app
COPY app /app 
COPY cmd.sh /
EXPOSE 9090 9191
USER uwsgi
CMD ["/cmd.sh"]
