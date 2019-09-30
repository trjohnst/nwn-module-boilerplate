After working with various module building tooling and running into many issues along the way, I figured it'd be worth setting up a working copy of a dev workflow for Neverwinter Nights module development that I use and hopefully save someone else the trouble. Assuming you work in an environment with bash and use docker, this repo should get you up and running with developing your own modules as soon as you fork it.

It is initialized with the Power Crazed module (shameless plug for my favorite character build tester module).

# Runtime Requirements
* Bash installed
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
Running the module in as a server is all wired up and can be run using `docker-compose` with the `docker-compose-prod.yml` file. The output of `docker-compose -f docker-compose-prod.yml up` will list an IP and port to connect to the server with.

If you're accessing your server from the same machine running the server, use 127.0.0.1 instead of the IP listed in the logs but still with the same port.

If you'd like to access your server from a different machine, either use the local IP if you're on the same network, or [find your external ip](https://www.whatismyip.com) and enable port forwarding for the port confiured as `NWN_PORT` in `config/server.env`. A VPN clients like [hamachi](https://www.vpn.net) may be preferable if you can't access your router settings and just want to open a server for a few friends.

# Related Links
* [nwnxee/unified docker image](https://hub.docker.com/r/nwnxee/unified)
* [jakkn/nwn-devbase (used for tooling)](https://github.com/jakkn/nwn-devbase)
* [nwnsc](https://neverwintervault.org/project/nwnee/other/tool/nwnsc-nwn-enhanced-edition-script-compiler)
* [Docker Compose](https://docs.docker.com/compose/)
