FROM rocker/geospatial:3.6.1
RUN apt update && apt install -y --no-install-recommends \
  libavcodec-dev \
  libavformat-dev \
  libswscale-dev \
  libtbb-dev \
  libdc1394-22-dev
RUN install2.r --ncpus=1 rstan
RUN installGithub.r swarm-lab/ROpenCVLite
RUN Rscript -e 'ROpenCVLite::installOpenCV(batch=TRUE)'
RUN installGithub.r tractatus/wholebrain

# https://github.com/rocker-org/rocker-versioned/issues/153#issuecomment-512278246
RUN mkdir /usr/local/lib/R/host-site-library

RUN echo "R_LIBS_USER=/usr/local/lib/R/host-site-library" >> $(R RHOME)/etc/Renviron.site 

