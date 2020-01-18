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
Refer to the directory structure diagram below learn about the important Daphne development directories
<br>
<br>

[01;34m.[00m
|-- [01;34mbin[00m
|-- [01;34mbuild[00m
|-- [01;34mdaphne[00m
|-- docker-compose.yml
|-- LICENSE
|-- [01;34mlogs[00m
|-- README.md
`-- [01;34mref[00m



 
