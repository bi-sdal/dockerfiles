# dockerfiles

# Getting this repository

- `clone` this repository as normal
- then in the repository run:
    - `git submodule init`
    - `git submodule update`
- or you can run `git clone --recursive <repository URL>`

# Getting (fetch/merge) all changes in submodles

assumes you want to update the checkout to the `master` branch

`git submodule update --remote`

# Getting the `diff` by showing submodule log

`git diff --submodule`

# Pushing and Pulling

- `git pull --recurse-submodules=yes origin master`
- `git push --recurse-submodules=on-demand origin master`

# What's in here?

scripts and stuff for the docker containers

- `install.R`: Script to install packages (used by docker containers)
- `docker-compose.yml`: `docker-compose up -d` to spin up all the containers

This repository uses `git submodules` because of how the `docker-compose.yml` spins up containers.
This allows us to keep the `docker-compose.yml` file on the same directory as the other docker containers,
without having to rename containers as they spin up.

something..something.. how `docker-compose` uses the folder it is in as a prefix for container names.
Caused an error with the networking.
