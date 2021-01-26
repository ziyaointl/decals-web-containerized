FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"]
WORKDIR /app

COPY requirements.txt /app/

RUN apt update && \
    apt upgrade -y && \
    apt install -y build-essential python3 python3-distutils python3-dev curl git libpcre3 libpcre3-dev \
    pkg-config swig libcairo2-dev libnetpbm10-dev netpbm libpng-dev libjpeg-dev zlib1g-dev libbz2-dev \
    libcfitsio-dev wcslib-dev iputils-ping iotop dnsutils && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get -y clean

RUN pip install -e git+http://github.com/dstndstn/astrometry.net@0.84#egg=astrometry --log LOG_FILE && \
    pip install -e git+https://github.com/dstndstn/tractor.git@dr9.5#egg=tractor

COPY . /app
ENTRYPOINT ["/app/entry.sh"]

#EXPOSE 8000
#CMD ["python3", "decals-web/manage.py", "runserver", "0.0.0.0:8000"]
