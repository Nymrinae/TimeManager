FROM elixir:latest

RUN apt-get update && \
  apt-get install -y postgresql-client

RUN mkdir /server
COPY . /server
WORKDIR /server

RUN mix local.hex --force
RUN mix do compile

CMD ["/server/run.sh"]