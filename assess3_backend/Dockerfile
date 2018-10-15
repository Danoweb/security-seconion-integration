FROM ruby:latest
LABEL author="Dan Reed <danreed1986@hotmail.com>"

#Make sure we have bash
RUN apt-get install bash -y

#Project Setup
RUN mkdir /usr/app/api
WORKDIR /usr/app/api

COPY /src/Gemfile /usr/app/api
#COPY /src/Gemfile.lock /usr/app/
RUN bundle install

COPY ./src/ /usr/app/api

CMD ["/usr/app/api"]