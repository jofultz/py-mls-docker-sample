#FROM tiangolo/uwsgi-nginx-flask:python3.6-alpine3.7
FROM tiangolo/uwsgi-nginx-flask:python3.6

#disto info
RUN cat /etc/issue

RUN pip install --upgrade pip \
   && apt-get update \
   && apt-get install -y apt-utils

# ML Server Python
RUN apt-get -y update \
   && apt-get install -y apt-transport-https wget \
   && wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb \
   && dpkg -i packages-microsoft-prod.deb \
   && rm -f packages-microsoft-prod.deb \
   && apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893 \
   && apt-get -y update \
   && apt-get install -y microsoft-mlserver-packages-py-9.3.0

#dependencies needed for azureml packages
RUN pip install dill PyJWT cryptography

#copy the ML libraries into the python path for the app
RUN cp -r /opt/microsoft/mlserver/9.3.0/runtime/python/lib/python3.5/site-packages/adal* /usr/local/lib/python3.6/site-packages
RUN cp -r /opt/microsoft/mlserver/9.3.0/runtime/python/lib/python3.5/site-packages/liac* /usr/local/lib/python3.6/site-packages
RUN cp -r /opt/microsoft/mlserver/9.3.0/runtime/python/lib/python3.5/site-packages/azureml* /usr/local/lib/python3.6/site-packages


# add needed packages for front-end app
RUN pip install dash dash-core-components dash-html-components dash_dangerously_set_inner_html pandas requests

ENV LISTEN_PORT=80

EXPOSE 80

COPY /app /app


