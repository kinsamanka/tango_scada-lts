FROM ubuntu:focal

RUN echo 'tango-common tango-common/tango-host string localhost:10000' | debconf-set-selections && \
    echo 'tango-db tango-db/dbconfig-install boolean false' | debconf-set-selections && \
    apt update && apt install -y  --no-install-recommends \
        sudo tango-db tango-test wait-for-it && \
    rm /etc/tangorc && \
    apt clean && \
    useradd --create-home --home-dir /home/user user && \
    usermod -a -G tango user && \
    echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user && \
    chmod 0440 /etc/sudoers.d/user

USER user
