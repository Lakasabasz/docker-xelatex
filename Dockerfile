#: title  : lakasabasz/xelatex - frok from moss/xelatex
#: author : "Willian Paixao" <willian@ufpa.br>
#: version: "1.3.2"
FROM ubuntu:24.04

LABEL org.opencontainers.image.authors="Willian Paixao <willian@ufpa.br>; Łukasz Mastalerz <lakasabasz@gmail.com>"
LABEL org.opencontainers.image.licenses="GPL-3.0"
LABEL org.opencontainers.image.source="https://github.com/Lakasabasz/docker-xelatex"
LABEL org.opencontainers.image.title="lakasabasz/xelatex"
LABEL org.opencontainers.image.version="1.0.1"
LABEL org.opencontainers.image.description="Docker image for compiling XeLaTeX documents"

RUN apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y multiverse

# Install all TeX and LaTeX dependencies
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections 
RUN apt-get update && \
  apt-get install --yes --no-install-recommends \
  ca-certificates \
  git \
  html2text \
  inotify-tools \
  lmodern \
  make \
  texlive-extra-utils \
  texlive-fonts-recommended \
  texlive-lang-english \
  texlive-lang-portuguese \
  texlive-lang-polish \
  texlive-plain-generic \
  texlive-xetex \
  ttf-mscorefonts-installer && \
  apt-get autoclean && apt-get --purge --yes autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Export the output data
WORKDIR /data
VOLUME ["/data"]
