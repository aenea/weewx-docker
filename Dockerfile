ROM felddy/weewx
RUN pip install --upgrade pip
RUN pip install PyMySQL
RUN pip cache purge

WORKDIR /home/weewx

RUN bin/wee_extension --uninstall interceptor
RUN bin/wee_extension --uninstall mqtt

RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install apt-utils -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y wget
RUN wget -q -O /tmp/weewx-mqtt.zip https://github.com/aenea/weewx-mqtt/archive/refs/heads/master.zip
RUN bin/wee_extension --install /tmp/weewx-mqtt.zip

RUN DEBIAN_FRONTEND=noninteractive apt-get clean
