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
   - <b>Stipulation</b>: you must `git clone` this project into your Windows file system. Not in the Ubuntu one.
 - Docker / Docker Compose
   - Installation instructions here: https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly
   
   

## Installation

 1. Navigate to the root directory of this repository (using Ubuntu shell if on Windows)
 2. Run the <i>unix_installer</i> shell script with the command `bash ./bin/unix_installer.sh`
 3. Once the script has finished, open a web browser (firefox preferred) and navigate to `localhost:8080`  

 
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

