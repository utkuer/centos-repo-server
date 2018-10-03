FROM centos/systemd
MAINTAINER "Utku Er" <utku.er@gmail.com>
WORKDIR ./
RUN yum -y install epel-release; yum -y install nginx; yum clean all; systemctl enable nginx
COPY  ./makerepo.sh /
COPY ./repos.conf /etc/nginx/conf.d/
CMD ["/usr/sbin/init"]
EXPOSE 8080
