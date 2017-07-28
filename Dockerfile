FROM nerzhul/freebsd:11.1-p0
MAINTAINER Loic Blot <loic.blot@unix-experience.fr>
LABEL Description="Redis 3.2.9 for FreeBSD"
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf && ASSUME_ALWAYS_YES=true pkg -qy install redis
RUN sed -ie 's/daemonize yes/daemonize no/g' /usr/local/etc/redis.conf && sysrc redis_enable=yes
EXPOSE 6379
CMD ["service", "redis", "start"]
