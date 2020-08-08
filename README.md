# docker-entrypoint

docker-entrypoint is a simple script that sets up a Unix user inside a docker container environment with specified user name, id, and login shell.

You can override the docker entrypoint in `docker run` command with this script and have the container run the given command as your user id

### Quick Start
1. clone this repository

```
git clone git@github.com:mayurva/docker-entrypoint.git
cd docker-entrypoint
```

2. Run the following docker run command.

```
docker run -it -v $HOME:$HOME -v $PWD/docker-entrypoint.sh:/docker-entrypoint.sh:ro --entrypoint=/docker-entrypoint.sh -e RUN_USER=$USER -e RUN_UID=$(id -u) -e RUN_SHELL=$SHELL -w $PWD python whoami && id -u && pwd && ls -al
```

This command should successfully display user name, uid, current working directory, and list of all the files in that directory.

### Installation

1. Run the following command to install the script

```
make install
```

Note that the make target will try to install the script in `/usr/local/bin`. Your user must be a part of `staff` group for the installation to be successful. If you do not have write access to the `/usr/local/bin` directory, you can drop this script in your home directory, or any other directory.

2. Create an alias for easy invocation of docker run command

```
alias dritpsh='docker run -it -v $HOME:$HOME -v $(which docker-entrypoint.sh):/docker-entrypoint.sh:ro --entrypoint=/docker-entrypoint.sh -e RUN_USER=$USER -e RUN_UID=$(id -u) -e RUN_SHELL=$SHELL -w $PWD'
```

Add this alias to your `~/.bashrc` or `~/.profile` file to make it permanently available.

3. Run commands in a docker container

```
dritpsh python python --version
```

4. If you don't specify a command to docker run as below, you will get an interactive shell prompt

```
dritpsh python
```

To uninstall the script, run the following command

```
make uninstall
```

### Why this tool?

I love to use docker for local development. However, a typical problem I run into with many docker images is that the default user inside is `root`. This becomes a problem when I want to mount local directories into the container. The user names and uids mismatch and it is near impossible to manage simultaneous changes from inside and outside the container.

One solution is to rebuild the docker image locally with correct user setup, but that requires upkeep and setup every time you upgrade the docker image or clean up local images. It also means you have to maintain separate containers on different machines and for different users.

This script provides a simple, fast, and generic way to manage your user inside the docker containers.

### Bugs and contributions

If you run into any problems, file a Github issue. Feel free to send pull requests to contribute to this project.
