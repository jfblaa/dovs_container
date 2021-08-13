FROM ocaml/opam:debian-ocaml-4.12

USER root
RUN apt-get update && apt-get -y install \
    opam \
    make \
    gcc \
    m4 \
    rlwrap \
    clang \
    lldb

COPY . .

RUN opam install .  --deps-only --locked && \
    opam install ocaml-lsp-server -y && \
    opam user-setup install && \
    eval $(opam env)
