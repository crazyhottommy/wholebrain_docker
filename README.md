# wholebrain_docker
docker file for wholebrain http://www.wholebrainsoftware.org/cms/installing-wholebrain-on-ubuntudebian/


`rstan` needs bigger memory, otherwise get "g++: internal compiler error: Killed (program cc1plus) rstan"
error

```bash
docker build . -t wholebrain01062020 -m 8g

## push to dockerhub
docker tag wholebrain01062020 crazyhottommy/wholebrain0.1.35
docker push crazyhottommy/wholebrain0.1.35
```

```bash
# run interactively
docker run -it wholebrain01062020 bash
root@f62a70bc306e:/# R 
> library(wholebrain)
Loading required package: Rcpp
Loading required package: png
Loading required package: MASS
Loading required package: grImport
Loading required package: grid
Loading required package: XML
Loading required package: sp
Loading required package: rgl
Loading required package: misc3d
Loading required package: plyr
WholeBrain (version 0.1.35) "Thurstone"
 by Daniel Fürth, 2018, by using this software you agree to the EULA
Warning messages:
1: In rgl.init(initValue, onlyNULL) : RGL: unable to open X11 display
2: 'rgl_init' failed, running with rgl.useNULL = TRUE
```

### Run in Rstudio server

follow my blog post https://divingintogeneticsandgenomics.rbind.io/post/develop-bioconductor-packages-with-docker-container/


```bash
docker run                                      \
  -e PASSWORD="xyz"                   \
  -p 8282:8787                                \
  wholebrain01062020

```

open web browser, type `localhost:8282`, you will be prompt to type user name and password.
default user name is : `rstudio` and the password is dummy `xyz` in this example.

The home directory of this docker image is `/home/rstudio`, so you may want to mount your local
folders (`github_repo` folder in my home directory in this example) there. 
Also, if you want to install additional R packages, you can mount a directory 
for this.


```bash
mkdir  -p ~/R/wholebrain_docker 

docker run                                      \
  -e PASSWORD="xyz"                   \
  -p 8282:8787                                \
  -v ~/github_repos:/home/rstudio \
  -v ~/R/wholebrain_docker:/usr/local/lib/R/host-site-library \
  wholebrain01062020

```


