FROM elixir:latest

RUN mkdir /server
COPY . /server
WORKDIR /server

RUN mix local.hex --force && \
mix local.rebar --force && \
mix deps.update --all

RUN mix do compile

CMD bash run.sh
