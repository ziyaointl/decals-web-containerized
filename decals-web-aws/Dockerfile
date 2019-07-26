FROM ubuntu:18.04

SHELL ["/bin/bash", "-c"]
WORKDIR /app

COPY requirements.txt /app/

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential python3 python3-distutils python3-dev curl git libpcre3 libpcre3-dev nginx && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    pip install --no-cache-dir -r requirements.txt

COPY . /app    

RUN ln -s /app/viewer.conf /etc/nginx/sites-enabled && \
    rm /etc/nginx/sites-enabled/default && \
    export PYTHONPATH=$(pwd)/legacypipe/py:$PYTHONPATH && \
    export PYTHONPATH=$(pwd)/tractor:$PYTHONPATH && \
    export PYTHONPATH=$(pwd)/decals-web:$PYTHONPATH && \
    cd decals-web && \
    python3 manage.py migrate && \
    apt-get -y clean

EXPOSE 80

ENTRYPOINT ["/app/entry.sh"]
#CMD ["python3", "decals-web/manage.py", "runserver", "0.0.0.0:8000"]
