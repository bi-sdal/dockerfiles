# dockerfiles

Getting this repository

- `clone` this repository as normal
- then in the repository run:
    - `git submoidule init`
    - `git submodule update`
- or you can run `git clone --recursive <repository URL>`

scripts and stuff for the docker containers

- `install.R`: Script to install packages (used by docker containers)
- `docker-compose.yml`: `docker-compose up -d` to spin up all the containers
