FROM ubuntu:22.04

RUN apt -y update

ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt -y install \
	git wget autoconf automake make gcc perl zlib1g-dev bzip2 libbz2-dev \
	xz-utils liblzma-dev curl libcurl4-openssl-dev libssl-dev ncurses-dev \
	graphviz gfortran unzip zip rsync vim r-cran-xml r-base r-base-dev libxml2-dev

RUN mkdir -p /project /nl /mnt /share
RUN apt-get update
RUN apt-get install -y --reinstall build-essential


# R Packages Installation
COPY install_packages.R /
RUN Rscript /install_packages.R
