FROM nerteronoffice/alpine6-node-base

USER root

COPY alpine-*.list /var/service/
COPY serf.py /bin/

ENV SERF_ADVERTISE_IP 172.17.42.1
ENV SERF_BIND_ADDRESS ""

RUN apk update && apk add curl make gcc g++ git python3 dnsmasq
RUN rm -r /var/cache/apk/*
RUN chmod +x /bin/serf.py

CMD /bin/serf.py

EXPOSE 7946/tcp 7946/udp
