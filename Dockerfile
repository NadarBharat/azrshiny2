# get shiny serves plus tidyverse packages image
FROM rocker/shiny-verse:latest
# system libraries of general use
RUN apt-get update && apt-get install -y \
    sudo \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev 
# install R packages required 
# (change it dependeing on the packages you need)
RUN R -e "install.packages('shiny', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinydashboard', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('shinyWidgets', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tosca', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('LDAvis', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('lubridate', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('servr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('NLP', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tm', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidytext', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('DT', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('readxl', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('writexl', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tidytext', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('xfun', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('syuzhet', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('sentimentr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('stringr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('stringi', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('Unicode', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('utf8', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('lexRankr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('text2vec', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('udpipe', repos='http://cran.rstudio.com/')"

RUN mkdir /root/app

COPY R /root/shiny_save

EXPOSE 80

# RUN dos2unix /usr/bin/shiny-server.sh && apt-get --purge remove -y dos2unix && rm -rf /var/lib/apt/lists/*
CMD ["R", "-e", "shiny::runApp('/root/shiny_save', host='0.0.0.0', port=80)"]