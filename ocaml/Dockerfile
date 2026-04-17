FROM ocaml/opam:debian-slim-5.2

USER root

# dune is the standard build system — everything else is on-demand
RUN opam install -y dune && \
    opam clean -a -c -s --logs

ENV PATH="/root/.opam/default/bin:/home/opam/.opam/default/bin:$PATH"

WORKDIR /code
CMD ["bash"]
