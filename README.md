# jupyter_docker

Template for running a jupyter notebook within a docker container.

Docker is very popularly used for managing dependencies and services by isolating them in a fixed environemt. For me as a Data Sceintist it's greatest benefit is that I can package my dependencies easily together with the code of my individual  projects. Thus I don't have to manage any vitual environment anymore. Another great benefit is that shared code can be run out of the box. Clearly Jupyter is one of the most common Data Science tools. This template aims at providing an out of the box method to run a jupyter server fromwithin a docker container.

## How to use:

Initially run in the root directory (where the Dockerfile is):

`docker build -t "jupyter_docker" .`

This will create a docker image named `jupyter_docker`. Duringcreatin of the image, it will execute `my_script.py`, so you can do any preprocessing, data loading and such things there (this is just for illustration purposes, feel free to delete it and remove the corresponding line in the Dockerfile). You can simply extend python dependencies by extending the [requirements.txt](src/requirements.txt)

Then you can run this image with

`docker run -p 8888:8888 -v </path/to/jupyter_docker/src>:/src jupyter_docker`

Here replace </path/to/jupyter_docker/src> with your local path, e.g. for me it's '/Home/wolle/git/jupyter_docker/src'.
This connects the port 8888 *inside the docker caontainer* with your local port 8888. So you can access the jupyert server within docker from your browser. Also it mounts the src directory of this repository to the src directory inside the docker contaner, so changes you do to this directory inside docker will be saved to the src directory on your local disk (i.e. you can save stuff you do on the jupyter server).

After executing this, you will see some instructions like this:

"""
To access the notebook, open this file in a browser:
        file:///root/.local/share/jupyter/runtime/nbserver-1-open.html
    Or copy and paste one of these URLs:
        http://661e91b5a5ed:8888/?token=ac5168d0ebfcdd6d11b157ac18978108fafd2b431c607eae
     or http://127.0.0.1:8888/?token=ac5168d0ebfcdd6d11b157ac18978108fafd2b431c607eae
"""

Copy that last URL from your terminal into your webbrowser and you should acces the jupyter server with root being the src directory of this repo. From there you can for example navigate to `notebooks` and run any notebook you find there.

## TODO:
 - move the docker commands to make maybe, to make it as simple as `make run`.
