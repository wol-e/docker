# xeyes in docker

based on https://medium.com/@SaravSun/running-gui-applications-inside-docker-containers-83d65c0db110

On linux host (tested on Ubuntu 21.04):
`docker build -t xeyes .`
`docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:$XAUTHORITY:rw" xeyes`

The last command may require setting `xhost +local:docker` on your host system to allow docker to xonnect to X server.
