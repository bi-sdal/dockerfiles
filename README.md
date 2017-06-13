# dockerfiles

Pretty much the entire SDAL infrastructure stack.

# Getting this repository

- `clone` this repository as normal: `git clone git@github.com:bi-sdal/dockerimages.git`
    - then in the repository run:
        - `git submodule init`
        - `git submodule update`
- or you can run `git clone --recursive git@github.com:bi-sdal/dockerimages.git`

# Making changes to the repository (not the submodules)

- Make edits like before
- `git add`
- `git commit -m ''`
- `git push origin master`

# Making changes to one of the submodules

- `cd` into the submodule
- `git checkout master`
- make changes and add/commit like a normal repository
- update submodule references (TODO)

# What's in here?

scripts and stuff for the docker containers

- `install.R`: Script to install packages (used by docker containers)
- `docker-compose.yml`: `docker-compose up -d` to spin up all the containers
- `build.sh`: script to built the containers properly, call this script from within one of the submodule folders `../build.sh`
- `gettin_docker_running_centos_7`: ???

This repository uses `git submodules`

Note: `docker-compose` uses the folder it is in as a prefix for container names.
Caused an error with the networking.
So the `dockerimages` repository name is really important here.

# Older commands and instructions

## Getting (fetch/merge) all changes in submodles

assumes you want to update the checkout to the `master` branch

`git submodule update --remote --merge`

## Getting the `diff` by showing submodule log

`git diff --submodule`

## Update everything

`git submodule foreach git pull origin master`

## AHHH!!! Just bring me to master

`git submodule foreach git checkout master && git submodule foreach git pull origin master`

## Pushing and Pulling

- `git pull --recurse-submodules=yes origin master`
- `git push --recurse-submodules=on-demand origin master`
