FROM elixir:1.18-slim

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /code
CMD ["bash"]
