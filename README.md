# wholebrain_docker
docker file for wholebrain http://www.wholebrainsoftware.org/cms/installing-wholebrain-on-ubuntudebian/


`rstan` needs bigger memory, otherwise get "g++: internal compiler error: Killed (program cc1plus) rstan"
error

```bash
docker build . -t wholebrain -m 6g
```