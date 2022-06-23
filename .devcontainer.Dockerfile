
FROM ubuntu:jammy

RUN apt-get update -qq

RUN apt-get install --no-install-recommends -y \
        software-properties-common \
        make \
        gcc \
        g++ \
        file \
        libc6-dev \
        libxml2-dev \
        dirmngr \
        gpg-agent \
        wget

RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

RUN apt-get install --no-install-recommends -y \
        r-base 

RUN add-apt-repository ppa:c2d4u.team/c2d4u4.0+

RUN R -e 'install.packages("languageserver")'
