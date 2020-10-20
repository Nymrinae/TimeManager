FROM elixir:latest

RUN mkdir /server
COPY . /server
WORKDIR /server

RUN mix local.hex --force
RUN mix do compile

CMD ["/server/run.sh"]