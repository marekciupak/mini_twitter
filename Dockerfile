FROM elixir:1.13

RUN mkdir /app
COPY . /app
WORKDIR /app

ENV MIX_ENV=prod
ENV PORT=4001

RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix deps.get --only prod
RUN mix compile
RUN mix assets.deploy

CMD ["mix", "phx.server"]
