FROM       hongtai91/nifieibv2:1.7.1-base
MAINTAINER Tai Tran <hongtai91@gmail.com>
ENV        BANNER_TEXT="" \
           S2S_PORT=""
COPY       start_nifi.sh /${NIFI_HOME}/
VOLUME     /opt/datafiles \
           /opt/scriptfiles \
           /opt/certfiles
WORKDIR    ${NIFI_HOME}
RUN        apk update && \
           apk add gnumeric && \
           apk add --update python python-dev py-pip build-base && \
           apk add ttf-freefont && \
           apk add unrar
RUN        chmod +x ./start_nifi.sh
CMD        ./start_nifi.sh