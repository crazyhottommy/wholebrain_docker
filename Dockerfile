FROM ubuntu:18.04
# https://www.monodevelop.com/download/#fndtn-download-lin

RUN apt update -y && apt-get install -y --fix-missing \
software-properties-common \
build-essential gcc \
build-essential

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y install libcurl4-gnutls-dev libxml2-dev libssl-dev
RUN apt-get -y install r-base
RUN apt-get -y  install fftw3 fftw3-dev pkg-config

RUN apt-get -y install libopencv-dev python3-opencv opencv-data 

RUN Rscript -e "install.packages('devtools')"
RUN Rscript -e "install.packages('rstan', dependencies = TRUE)"
RUN Rscript -e "devtools::install_github('tractatus/wholebrain')"