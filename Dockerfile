FROM ubuntu:latest

RUN apt update && apt install build-essential -y && apt install -y git cpanminus curl

RUN git clone https://github.com/tokuhirom/plenv.git ~/.plenv

# RUN echo "export PATH=~/.plenv/bin:~/.plenv/shims:$PATH" && PLENV_SHELL=bash

ENV PATH="${PATH}:~/.plenv/bin:~/.plenv/shims"

RUN echo 'eval "$(plenv init -)"' >> ~/.profile 

RUN git clone https://github.com/tokuhirom/Perl-Build.git ~/.plenv/plugins/perl-build/

RUN bash -c 'plenv install 5.34.0 -Dusethreads && plenv rehash && plenv global 5.34.0'

RUN bash -c 'plenv install-cpanm'

RUN bash -c "cpanm Carmel Path::This List::Util"

