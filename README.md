# Useful commands

First get a copy of the `Dockerfile` in this repository.  Easiest way
is to clone this.

## Build

    $ curl -LO https://packagecloud.io/install/repositories/modeanalytics/main/script.deb.sh
    $ docker build . -t modeanalytics

## Config local stuff

    $ mkdir conf
    $ chmod 777 conf

## Get a server running

Share the config in a volume so it persists appropriately

    $ docker run --rm --detach --volume=(pwd)/conf:/opt/mode/bridge/conf \
          --hostname=mode --name=modeanalytics modeanalytics

## Set config

Sets config options in the volume used by above

    $ docker exec modeanalytics /opt/mode/bridge/bin/mode-bridge-config \
          -init (pass work/modeanalytics-bridge/postgres)

Note: the bracket syntax is using the `fish` shell, adjust for your
shell as needed, and the `pass` command has the modeanalytics config
blob saved in it.
