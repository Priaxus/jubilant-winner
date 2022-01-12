# Introduction to Docker

## Docker Syntax
### Docker Images
```
docker images
```
### Getting docker packages
```
docker get PACKAGENAME:TAG
```
### Running docker terminals
```
docker run PACKAGENAME
```
This will run the package with the latest release, if you dont have the latest installed, it will pull it from the repository
```
docker run PACKAGENAME:TAG
```
#### Flags
```bash
docker run --interactive -t PACKAGENAME:TAG
```
### Inspecting docker packages
```
docker inspect PACKAGENAME:TAG
```
Gives lots of useful information about the package