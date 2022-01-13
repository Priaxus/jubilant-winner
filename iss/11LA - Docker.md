# 11LA - Docker

## Chat Server 0.1

Create file `Dockerfile-for-chat_0.1`
```bash
# docker build . --tag local/chat_i --tag local/chat_i:0.1

# the image from which we will start
FROM centos:7

# commands to run as root to modify original
RUN yum --assumeyes install \
  nmap-ncat

# tcp port in the container
EXPOSE 6666

# (default) command to run when container launches
ENTRYPOINT [  "/usr/bin/ncat", \
              "--keep-open",   \
              "--listen",      \
              "-4",            \
              "--chat"  ]

# (default) parameter to concatenate onto the command in ENTRYPOINT
CMD [ "6666" ]
```

Naming convention for docker:
```
xxxxx_i = Docker Image
xxxxx_c = Docker Container
xxxxx_v = Docker Volume
xxxxx_n = Docker Network
```

### To run a docker contianer

```
docker run --detach --rm -p 7777:6666 --name chat_c local/chat_i
```

#### Breakdown
`--detach` runs the process as a detached process (opposite of interactive), this can also just be written as `-d`
`--rm` means that upon killing the docker container, the container will be destroyed
`-p 7777:6666` maps port `7777` on the real machine to port `6666` on the container
`--name chat_c` is the name given to the docker container
`local/chat_i` is the docker image that is to be used to create the container

### To diagnose things
`docker logs CONTAINER`


## By next Wednesday
- Play with docker building
- Play with docker logs
- Play with docker mounting to a volume

## Chat sErver 0.3
```bash
#  docker build --tag local/chat_i  --tag local/chat_i:0.3 .
#  docker run --name chat_c -d -p 127.0.0.1:7777:4567 local/chat_i:0.3 4567

# the image from which we will start
FROM centos:7

# commands to run as root to modify original
RUN yum --assumeyes install \
  nmap-ncat

# tcp port in the container
EXPOSE 6666

# create a system user id that will run the service
RUN useradd -r -u 876 chatter

# from now on, do everything as this new user
USER chatter

# (default) command to run when container launches
ENTRYPOINT [  "/usr/bin/ncat", \
              "--keep-open",   \
              "--listen",      \
              "-4",            \
              "--chat"  ]

# (default) parameter to concatenate onto the command in ENTRYPOINT
CMD [ "6666"  ]
```