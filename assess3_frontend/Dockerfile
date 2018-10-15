FROM ruby:latest
MAINTAINER Dan Reed <danreed1986@hotmail.com>

#Make sure we have bash
RUN apt-get install bash -y

#Project Setup
RUN mkdir /usr/app
WORKDIR /usr/app

COPY /src/Gemfile /usr/app/
#COPY /src/Gemfile.lock /usr/app/
RUN bundle install

COPY ./src/ /usr/app

CMD ["/usr/app/check.rb"]

