This repository is meant to demonstrate the `discord_status.nss` capabilities and is minimally wired up to the modules on client enter and on client leave events.

It is initialized with the Power Crazed module (my favorite build tester module).

# Requirements
* Bash capable environment
* Docker and Docker Compose installed

# Using the Repo

## Switching the Module
You can initialize a new module by
1. Delete `src`
2. Delete `server`
3. Run `./commands/init.sh` to initialize the nwnbuild project
4. Put the new module in `server/modules`
5. Run `./commands/extract.sh` to "decompile" the module into editable plain text resources

## Compiling a Module
Prior to running the module and after you've modified any assets in `src`, you will need to update the module with those new assets.

To do so, you can run `./commands/build.sh`.

If you see `No matching files for input wildcard path *.nss.` while running `./commands/build.sh`, run it again. On some machines, the nwn-devbase docker image is unable to find the nss assets to compile so they are currently being compiled externally with the nwnsc docker image. To get around nwn-devbase's internal script compilation caching.

## Running the module as a server
Running the module in as a server is all wired up and can be run using `docker-compose` with the `docker-compose-prod.yml` file. The output of `docker-compose -f docker-compose-prod.yml up` will list an IP and port to connect to the server with. If accessing it locally, you can replace the IP with `127.0.0.1` or you will need to make sure you have port forwarding setup on port `5121`.

# Related Links
* [nwnxee/unified docker image](https://hub.docker.com/r/nwnxee/unified)
* [jakkn/nwn-devbase (used for tooling)](https://github.com/jakkn/nwn-devbase)
* [nwnsc](https://neverwintervault.org/project/nwnee/other/tool/nwnsc-nwn-enhanced-edition-script-compiler)
* [Docker Compose](https://docs.docker.com/compose/)
