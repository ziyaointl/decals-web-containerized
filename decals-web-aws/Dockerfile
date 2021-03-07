FROM python:3.6-buster

SHELL ["/bin/bash", "-c"]
WORKDIR /app

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential curl git swig libpcre3 libpcre3-dev nginx

COPY requirements.txt /app/
# We must install intel-numpy first, because otherwise pip does not realize it provides 'numpy'
# and it will install regular numpy as well as intel-numpy, and problems will result
# (eg with fitsio).  intel-numpy is a requirement of mkl-fft.
RUN pip install --no-cache-dir intel-numpy
RUN pip install --no-cache-dir -r requirements.txt

RUN mkdir -p decals-web/data/sga && \
    curl -o decals-web/data/sga/SGA-ellipse-v3.2-cut.kd.fits https://portal.nersc.gov/project/cosmo/temp/dstn/SGA-ellipse-v3.2-cut.kd.fits && \
    curl -o decals-web/data/tycho2-sub.kd.fits https://portal.nersc.gov/project/cosmo/temp/dstn/tycho2-sub.kd.fits

COPY . /app    

RUN ln -s /app/viewer.conf /etc/nginx/sites-enabled && \
    rm /etc/nginx/sites-enabled/default

EXPOSE 80

ENTRYPOINT ["/app/entry.sh"]
#CMD ["python3", "decals-web/manage.py", "runserver", "0.0.0.0:8000"]
