# conda_docker

Running a bash shell from docker with conda. A usecase I had for this was running conda projects without having to install conda on my machine.

## Requirements
[docker](https://www.docker.com/)

## How to use:

Initially run in this  directory (where the Dockerfile is):

`docker build -t "conda_docker" .`

This will create a docker image named `conda_docker`.

You can then enter a shell with conda available and additionally mounting your favourite directory /your/dir with

`docker run -i -t  -v /your/dir:/wd conda_docker /bin/bash`.
