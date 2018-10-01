# Introduction

Creates a local centos repository server running on nginx

# Usage

## Creating the Repo Server with external volume
### You can use this scenario if you want to locate packages to a different file system.

Copy "Dockerfile", "makerepo.sh" and "repos.conf" to the same directory (let's say /docker/reposerver)
Change directory to /docker/reposerver and build image; "docker build --rm --no-cache -t utku/reposerver"
Run image with the following command; "docker run --privileged  -v /repo/repo1:/repo:rw -p 8080:8080 -ti   utku/reposerver "
