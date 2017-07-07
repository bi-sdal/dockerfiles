docker-compose down

docker-compose up -d

docker exec -it rpkgs bash -c '\
    wget -O install_cran.R https://raw.githubusercontent.com/bi-sdal/rpkgs-mro-ldap-ssh-c7/master/install_cran.R && \
    wget -O install_github.R https://raw.githubusercontent.com/bi-sdal/rpkgs-mro-ldap-ssh-c7/master/install_github.R && \
    pwd && ls -alh && \
    Rscript install_cran.R && \
    Rscript install_github.R'
