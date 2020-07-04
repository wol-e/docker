# docker_jupyter

Template for running a jupyter notebook within a docker container.

## How to use:

Initially run in the root directory (where the Dockerfile is):

`docker build -t "docker_jupyter" .`

This will create a docker image named `docker_jupyter`. Duringcreatin of the image, it will execute `my_script.py`, so you can do any preprocessing, data loading and such there.

Then you can run this image with

`docker run -p 8888:8888 jupyter_docker`

This connects the port 8888 *inside the docker caontainer* with your local port 8888. So you can access the jupyert server within docker from your browser.

After executing this, you will see some instructions like this:

"""
To access the notebook, open this file in a browser:
        file:///root/.local/share/jupyter/runtime/nbserver-1-open.html
    Or copy and paste one of these URLs:
        http://661e91b5a5ed:8888/?token=ac5168d0ebfcdd6d11b157ac18978108fafd2b431c607eae
     or http://127.0.0.1:8888/?token=ac5168d0ebfcdd6d11b157ac18978108fafd2b431c607eae
"""

Copy that last URL from your terminal into your webbrowser and you should see this root directory on the jupyter server. From there you can for example navigate to `notebooks` and run any notebook you find there.

TODO: move the docker commands to make maybe, to make it as simple as `make run`.
TODO: attach src as a volume ot docker, so that changes when working inside the caontainer are saved