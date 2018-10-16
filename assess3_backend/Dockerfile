FROM ruby:latest
LABEL author="Dan Reed <danreed1986@hotmail.com>"

#Make sure we have needed packages
RUN apt-get update -qq && apt-get install -y bash build-essential libpq-dev libgmp3-dev nodejs

#Project Setup
RUN mkdir /usr/app-api

COPY ./src/ /usr/app-api

WORKDIR /usr/app-api/events

RUN bundle install

#RUN rake db:migrate
#RUN rake db:seed