# Introduction to Docker

## Docker Syntax
### Docker Images
```
docker images
```
This will list all the docker images that are in your local image store

### Getting docker packages
```
docker get PACKAGENAME:TAG
```
This will download the specified tagged package

### Running docker terminals
```
docker run PACKAGENAME
```
This will run the package with the latest release, if you dont have the latest installed, it will pull it from the repository
```
docker run PACKAGENAME:TAG
```
Alternatively, you can specify which tag you want it to run

#### Flags
```bash
docker run --interactive -t PACKAGENAME:TAG
```
These tags create an interactive terminal instance that you can use

### Inspecting docker packages
```
docker inspect PACKAGENAME:TAG
```
Gives lots of useful information about the package