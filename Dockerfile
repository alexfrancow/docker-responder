#FROM debian:stable
FROM isaudits/msf:minimal

WORKDIR /root/

ENV LC_ALL C.UTF-8
ENV STAGING_KEY=RANDOM
ENV DEBIAN_FRONTEND noninteractive

ENV DEPS_GENERAL='git curl wget sudo locales lsb-release apt-transport-https net-tools nmap python3-dev python3-pip python3-requests'
ENV DEPS_REMOVE='build-essential make g++'

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
        $DEPS_GENERAL && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    #pip install -U cryptography && \
    pip3 install impacket 

RUN git clone --depth=1 https://github.com/lgandx/Responder /opt/Responder &&  \  
    rm -rf /opt/Responder/.git && \
    pip3 install netifaces && \
    sed -i "s/Challenge = Random/Challenge = 1122334455667788/g" /opt/Responder/Responder.conf

ENTRYPOINT ["python3", "/opt/Responder/Responder.py", "-I", "eth0", "-d", "-w"]
