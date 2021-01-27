# jupyter_docker

This template provides an out of the box method to run a jupyter server from within a docker container.

## Requirements
[docker](https://www.docker.com/)

## How to use:

Initially run in this  directory (where the Dockerfile is):

`docker build -t "jupyter_docker" .`

This will create a docker image named `jupyter_docker`. Duringcreatin of the image, it will execute `my_script.py`, so you can do any preprocessing, data loading and such things there (this is just for illustration purposes, feel free to delete it and remove the corresponding line in the Dockerfile). You can simply extend python dependencies by extending the [requirements.txt](src/requirements.txt)

Then you can run this image with

`docker run -p 8888:8888 -v </path/to/jupyter_docker>:/wd jupyter_docker`

Here replace </path/to/jupyter_docker> with your local path (or just use $PWD). This connects the port 8888 *inside the docker caontainer* with your local port 8888. So you can access the jupyter server within docker from your browser. Also it mounts the src directory of this repository to the src directory inside the docker container, so changes you do to this directory inside docker will be saved to the src directory on your local disk (i.e. you can save stuff you do on the jupyter server).

After executing this, you will see some instructions like this:

"""
To access the notebook, open this file in a browser:
        file:///root/.local/share/jupyter/runtime/nbserver-1-open.html
    Or copy and paste one of these URLs:
        http://661e91b5a5ed:8888/?token=ac5168d0ebfcdd6d11b157ac18978108fafd2b431c607eae
     or http://127.0.0.1:8888/?token=ac5168d0ebfcdd6d11b157ac18978108fafd2b431c607eae
"""

Copy that last URL from your terminal into your webbrowser and you should acces the jupyter server with root being the src directory of this repo. From there you can for example navigate to `notebooks` and run any notebook you find there.

## Notes:
 - To make the usage more convenient one can for example add a layer with `make`so that one just needs to call `make run` or something like that. Then all the docker commands are hidden. However, the repo also aims at educating about how docker works, so having it explicit is serving a purpose.
