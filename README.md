# Introduction

Creates a local centos repository server running on nginx

# Usage

## Scenario1: Locating repo packages on an external volume;
### A 30GB file system created and mounted as /repo on docker host.
### "/repo/repo1" directory created and mounted to container as "/repo"

*1- Copy "Dockerfile", "makerepo.sh" and "repos.conf" to the same directory (let's say /docker/reposerver)
*2- "cd /docker/reposerver" and build image; "docker build --rm --no-cache -t local/reposerver"
*3- Run image with the following command; "docker run -v /repo/repo1:/repo:rw local/reposerver /makerepo.sh". This command downloads packages for the first time, create repo and exit. You don't have to run your container with "/makerepo.sh" next time unless you want to check updates.
*4- Kill this image and run a new one without "makerepo.sh"; "docker rm -f $(docker ps -aq)", "docker run --privileged -v /repo/repo1:/repo:rw -p 8080:8080 -ti   local/reposerver"
*5- Try to access repo server; "http://[ip_address_of_docker_host]:8080/"
*6- If you want to check updates during container startup, just run "step-3"
*7- On the client side, copy local-repos.repo under /etc/yum.repos.d/ (make sure you change the urls poniting to your repo server)
*8- Check the repo list "yum repolist all" and see your new repo server
*9- Check update with "yum update"
