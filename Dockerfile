FROM node:8

COPY ./app app
COPY ./environment environment

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx -y
CMD nginx -g

RUN rm /etc/nginx/sites-available/default
RUN ln -s ~/environment/app/default /etc/nginx/sites-available/default

RUN service nginx restart
