FROM quay.io/nushell/nu:latest

WORKDIR /opt

RUN apt-get -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update && \
    apt-get -y install git && \
    apt-get clean && \
    git clone https://github.com/pbackz/nushell-az-functions

# If u want use a rust binary plugin
# COPY /target/debug/ebay_bot /bin/

WORKDIR /opt/nushell-az-functions

ENTRYPOINT ["nu"]