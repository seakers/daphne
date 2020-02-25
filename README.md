# Daphne Development Container

This repository houses a docker implementation of Daphne that can run on both Windows and Unix based operating systems. 
The purpose of this container is to shorten the Daphne development cycle. 
<br>
<br>
If you would like read about the purpose of Daphne, the `/refs` directory contains published papers detailing just that.


## Dependencies



### Unix

 - Docker
   - Installation instructions here: https://docs.docker.com/install/linux/docker-ce/ubuntu/
 - Docker Compose
   - Installation instruction here: https://docs.docker.com/compose/install/


### Windows 10

 - Windows Subsystem - Ubuntu 18.04 (only for Windows)
   - Installation instructions here https://docs.microsoft.com/en-us/windows/wsl/install-win10
   - <b>You must `git clone` this project into your Windows file system (\c or \e drive) from your Ubuntu shell. 
 - Docker / Docker Compose</b>
   - Installation instructions here: https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly
   
   

## Installation

 1. Make sure ports: `8080`, `5432`, `6379`, `5671`, `5672`, `15672` are open on your machine (docker networking will need these)
 2. Navigate to the root directory of this repository (using Ubuntu shell if on Windows)
 3. Run the <i>unix_installer</i> shell script with the command `bash ./bin/unix_installer.sh`
 4. Once the script has finished, open a web browser (firefox preferred) and navigate to `localhost:8080`  

 
## How to Develop
 
The key to leveraging the full power of this development tool is understanding its directory structure.
Refer to the top level directory structure diagram below to learn about the important Daphne development directories.
<br>

```bash
Daphne Container - post installation
.
|-- bin                         --> Installation scripts
|-- build                       --> Daphne local dependencies
|-- daphne                      --> Daphne source code
|-- docker-compose.yml
|-- LICENSE
|-- logs                        --> Daphne output logs
|-- README.md
`-- ref                         --> Daphne publications
```

The two Daphne development directories are `/daphne` and `/logs`. 
<br>
<br>

### `/daphne`

This directory contains all the Daphne source code. 
It resides on your local machine and has been bind mounted on the Daphne container.
This allows you to make changes to Daphne source code and see your changes reflected in real time.
See the `/daphne` directory structure below for more information.

```bash
./daphne
|-- command_classifier          --> ML training
|-- daphne_brain                --> Django back-end
|-- daphne-interface            --> Vue / Vuex front-end
|-- data-mining                 --> Datamining service
|-- historical_db
|-- java_libs
|-- orekit
|-- SystemArchitectureProblems
|-- VASSAR_lib
|-- VASSAR_resources
`-- VASSAR_server               --> VASSAR service
```
<br>

### `/logs`

This directory contains two output logs (standard error and output) for each Daphne component. 
These log files reside in the Docker container, so you will only have read access to them.
Because they are being edited by the container in real time, you will have to re-open these files whenever you wish to see updated output.

```bash
./logs
|-- brain.err.log
|-- brain.out.log
|-- datamining.err.log
|-- datamining.out.log
|-- interface.err.log
|-- interface.out.log
|-- vassar.err.log
`-- vassar.out.log
```

# Daphne Terminal Commands

At the end of installation, you will be asked if you want to add the "daphne" executable to your PATH environment variable.
If you opt to, then you will have some useful Daphne commands at your disposal.
Please see the commands below.

Note: after the installer edits either your .bashrc or .bash_profile, you will have to start a new terminal to reflect the changes.



<br>




## Container Commands

`daphne up` - Starts all Daphne containers and runs all services

`daphne down` - Stops all Daphne containers, commits container changes to local image, and removes containers

`daphne shell` - Returns a shell inside the docker container

`daphne status` - Prints out the running status, pid, and runtime for each daphne service

`daphne prod build` - Builds and compiles Daphne services for production on a server

`daphne image rebuild` - Completely rebuild daphne image (use when new updates come out!)


## Service Commands

Service commands are in the form `daphne (service) (command)` <br>

Here is a list of all Daphne's services
 - interface
 - brain
 - vassar
 - datamining
 
 
See below for specific service commands

### Interface (front-end)

`daphne interface start` - starts hosting daphne interface on port 8080

`daphne interface stop` - stops hosting daphne interface

`daphne interface restart` - restarts daphne interface

`daphne interface build` - reinstall all daphne interface dependencies 


### Brain

`daphne brain start` - runs daphne brain on port 8000

`daphne brain stop` - stops daphne brain process

`daphne brain restart` - restarts daphne brain (use to reflect any code changes)

`daphne brain index_historian_database` - runs web scraper to fill historian database

`daphne brain migrate` - migrates django models (use if you edit any model files)

`daphne brain train` - trains daphne brain question models


### Vassar

`daphne vassar start` - runs vassar on port 9090

`daphne vassar stop` - stops vassar process

`daphne vassar restart` - restarts vassar

`daphne vassar build` - builds vassar completely from scratch (use to reflect coding changes)

`daphne vassar clean` - removes processed orbit information in orekit repository


### Datamining

`daphne datamining start` - runs datamining on port 9191

`daphne datamining stop` - stops datamining process

`daphne datamining restart` - restarts datamining

`daphne datamining build` - build datamining completely from scratch (use to reflect coding changes)


### All

`daphne all start` - starts all daphne services

`daphne all stop` - stops all daphne services

`daphne all restart` - restarts all daphne services






