cran_pkgs <- c(
    'DBI',
    'RPostgreSQL',
    'tidyverse',
    'ggthemes',
    'rmarkdown',
    'curl',
    'httr',
    'rio',
    'devtools',
    'bigmemory',
    'biganalytics',
    'data.table',
    'shiny',
    'shinydashboard',
    'flexdashboard',
    'DT',
    'leaflet',
    'highcharter',
    'GGally',
    'glmnet',
    'useful',
    'coefplot',
    'rpart.plot',
    'randomForest',
    'RJSONIO',
    'PKI',
    'packrat',
    'rsconnect',
    'rstan',
    'ggmap',
    # GIS packages
    'rgdal',
    'rgeos',
    'tigris'
)

github_pkgs <- c(
    'bwlewis/rthreejs',
    'bi-sdal/sdalr'
)

install_error_message <- 
    "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!                                    !!!!!!!!!!
     !!!!!!!!!! A PACKAGE DID NOT INSTALL PROPERLY !!!!!!!!!!
     !!!!!!!!!!                                    !!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
     !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    "

tryCatch({
    install.packages(cran_pkgs)
}, error = function(e) {
    stop(install_error_message)
    Sys.sleep(10)
})

for (p in github_pkgs) {
    print(sprintf('Installing from Github: %s', p))
    tryCatch({
        devtools::install_github(p)
    }, error = function(e){
        stop(install_error_message)
        Sys.sleep(10)
    })
}

update.packages(ask = FALSE)

github_libs <- sapply(stringr::str_split(github_pkgs, pattern = '/'), function(x){x[2]})

all_pkgs <- c(cran_pkgs, github_libs)

all_pkgs[all_pkgs == 'rthreejs'] <- 'threejs'

for (p in all_pkgs){
    print(sprintf('Loading: %s', p))
    tryCatch({
        library(p, character.only = TRUE)
    }, error = function(e) {
        stop(install_error_message)
        Sys.sleep(10)
    })
}
