#FROM tiangolo/uwsgi-nginx-flask:python3.6-alpine3.7
FROM tiangolo/uwsgi-nginx-flask:python3.6

RUN pip install --upgrade pip

# Set location of the package repository. For example for 16.04.
#RUN wget https://packages.microsoft.com/ubuntu/16.04/prod/pool/main/m/microsoft-mlserver-packages-py-9.3.0/microsoft-mlserver-packages-py-9.3.0.deb -O /tmp/azml-py.deb
#RUN wget https://packages.microsoft.com/ubuntu/16.04/prod/pool/main/m/microsoft-mlserver-packages-py-9.3.0/microsoft-mlserver-packages-py-9.3.0.deb
#RUN ls /tmp
#RUN ls -la /etc/apt/sources.list.d/


RUN apt-get update
RUN apt-get install -y apt-utils
#RUN apt-get install apt-transport-https
#RUN apt-get install microsoft-mlserver-packages-py-9.3.0
#RUN dpkg -I /tmp/azml-py.deb

#disto info
RUN cat /etc/issue

#start here - original ML install
#RUN apt-get -y update \
#   && apt-get install -y apt-transport-https wget \
#   && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ xenial main" | tee /etc/apt/sources.list.d/azure-cli.list \
#   && wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb -O /tmp/prod.deb \
#   && dpkg -i /tmp/prod.deb \
#   && rm -f /tmp/prod.deb \
#   && apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893 \
#   && apt-get -y update \
#   && apt-get install -y microsoft-r-open-foreachiterators-3.4.3 \
#   && apt-get install -y microsoft-r-open-mkl-3.4.3 \
#   && apt-get install -y microsoft-r-open-mro-3.4.3 \
#   && apt-get install -y microsoft-mlserver-packages-r-9.3.0 \
#   && apt-get install -y microsoft-mlserver-python-9.3.0 \
#   && apt-get install -y microsoft-mlserver-packages-py-9.3.0 \
#   && apt-get install -y microsoft-mlserver-mml-r-9.3.0 \
#   && apt-get install -y microsoft-mlserver-mml-py-9.3.0 \
#   && apt-get install -y microsoft-mlserver-mlm-r-9.3.0 \
#   && apt-get install -y microsoft-mlserver-mlm-py-9.3.0 \
#   && apt-get install -y azure-cli=2.0.26-1~xenial \
#   && apt-get install -y dotnet-runtime-2.0.0 \
#   && apt-get install -y microsoft-mlserver-adminutil-9.3.0 \
#   && apt-get install -y microsoft-mlserver-config-rserve-9.3.0 \
#   && apt-get install -y microsoft-mlserver-computenode-9.3.0 \
#   && apt-get install -y microsoft-mlserver-webnode-9.3.0 \
#   && apt-get clean \
#   && /opt/microsoft/mlserver/9.3.0/bin/R/activate.sh
#end here - original ML install

#start modified ML install
#RUN apt-get -y update \
#   && apt-get install -y apt-transport-https wget \
#   && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ xenial main" | tee /etc/apt/sources.list.d/azure-cli.list \
#   && wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb -O /tmp/prod.deb \
#   && dpkg -i /tmp/prod.deb \
#   && rm -f /tmp/prod.deb \
#   && apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893 \
#   && apt-get -y update \
#   && apt-get install -y microsoft-mlserver-python-9.3.0 \
#   && apt-get install -y azure-cli=2.0.26-1~xenial \
#   && apt-get install -y dotnet-runtime-2.0.0 \
#   && apt-get install -y microsoft-mlserver-adminutil-9.3.0 \
#   && apt-get install -y microsoft-mlserver-computenode-9.3.0 \
#   && apt-get install -y microsoft-mlserver-webnode-9.3.0 \
#   && apt-get clean \
#   && /opt/microsoft/mlserver/9.3.0/bin/R/activate.sh
##end modified ML install

#add needed packages for front-end app
#RUN pip install dash-core-components
#RUN pip install dash-html-components
#RUN pip install dash_dangerously_set_inner_html
#RUN pip install pandas
#RUN pip install requests


# Verification step: look for the mlserver.list configuration file
#ls -la /etc/apt/sources.list.d/

# Update packages on your system
#apt-get update

# If your system does not have the https apt transport option
#apt-get install apt-transport-https

# Install the packages
#apt-get install microsoft-mlserver-packages-py-9.3.0

ENV LISTEN_PORT=80

EXPOSE 80

COPY /app /app