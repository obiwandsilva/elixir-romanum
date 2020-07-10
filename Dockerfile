FROM elixir:1.10.4-alpine
WORKDIR /tmp/romanum
COPY . .
COPY romanum /bin
RUN chmod +x /bin/romanum
ENV MIX_ENV prod
RUN mix release --version 1.0.1 --force