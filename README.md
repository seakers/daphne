# Daphne Development Container

This repository houses a docker implementation of Daphne that can run on both Windows and Unix based operating systems. 
The purpose of this container is to aid in Daphne feature development. 
<br>
<br>
If you would like read about the purpose of Daphne, the `/refs` directory contains published papers detailing just that.


### Dependencies

 - Docker
 - Docker Compose
 - Windows / Unix Based OS
 <br>

### Installation

#### Unix

 1. Navigate to the root directory of this repository
 2. Run <i>unix_installer</i> shell script with the command `bash ./bin/unix_installer.sh`
 3. Once the script has finished, open a web browser (firefox preferred) and navigate to `localhost:8080`  

#### Windows

 - Coming soon
 
 
## How to Develop
 
The key to leveraging the full power of this development tool is understanding its directory structure.
Refer to the top level directory structure diagram below learn about the important Daphne development directories.
<br>

```bash
Daphne structure post installation
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
It resides on your local machine, but has been bind mounted on the Daphne container.
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

This directory contains two output logs for each Daphne component (standard error and output). 
These log files reside in the Docker container, so you will only have read access to them.
Because they are being edited by the container in real time, you will have to re-open these files whenever you wish to see new output.

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

