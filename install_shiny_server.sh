#!/bin/bash
cd /tmp
runuser -l shiny Rscript -e 'install.packages("shiny")'
wget https://download3.rstudio.org/ubuntu-14.04/x86_64/shiny-server-1.5.7.907-amd64.deb
gdebi -n shiny-server-1.5.7.907-amd64.deb
# install required packages in R global directory
sudo R_LIBS_USER=/usr/local/lib/R/library Rscript -e 'install.packages(c("shiny","R6","httr"),repos="http://cloud.r-project.org/",lib="/usr/local/lib/R/library",dependencies=TRUE,Ncpus=32)'
sudo apt-get install git
cd /srv/shiny-server
sudo git clone https://gist.github.com/79d902e3c8124fc90d41820b541071f2.git register
