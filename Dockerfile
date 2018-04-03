FROM debian

MAINTAINER Stefan Haller <stefan.haller@agdsn.de>

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y python3 python3-pip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash user

COPY --chown=user:user . /home/user/

USER user
WORKDIR /home/user
RUN pip3 install -r requirements.txt

CMD while true; do date; python3 ./sync; sleep 12h; done
