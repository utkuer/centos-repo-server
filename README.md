# Introduction

Creates a local centos repository server running on nginx

# Usage

## Scenario1: Locating repo packages on an external volume;
### In this scenario, i created a 30GB file system as /repo on docker host, create a directory under it as "/repo/repo1" and mount it to container as "/repo" during container startup

* Copy "Dockerfile", "makerepo.sh" and "repos.conf" to the same directory (let's say /docker/reposerver)
* Change directory to /docker/reposerver and build image; "docker build --rm --no-cache -t local/reposerver"
* Run image with the following command; "docker run -v /repo/repo1:/repo:rw -p 8080:8080 -ti   local/reposerver /makerepo.sh". This command downloads packages for the first time, create repo and exit. You don't have to run your container with "/makerepo.sh" next time unless you want to check updates.
* Kill this image and run a new one without "makerepo.sh"; "docker rm -f $(docker ps -aq)", "docker run --privileged   -v /repo/repo1:/repo:rw -p 8080:8080 -ti   local/reposerver"
Try to access repo server; "http://[ip_address_of_docker_host]:8080/"
ıf you want to check updates during container startup, just add "/makerepo.sh" command at the end of previous line; "docker run --privileged   -v /repo/repo1:/repo:rw -p 8080:8080 -ti   local/reposerver /makerepo.sh"
