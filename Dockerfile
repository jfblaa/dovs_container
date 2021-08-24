FROM ocaml/opam:ubuntu-ocaml-4.12

USER root
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y install \
    make \
    gcc \
    m4 \
    rlwrap \
    clang \
    lldb \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

USER opam
COPY ./tiger.opam* .

RUN opam install .  --deps-only --locked && \
    opam install ocaml-lsp-server -y && \
    opam user-setup install && \
    eval $(opam env)
