FROM python:3.6-buster

SHELL ["/bin/bash", "-c"]
WORKDIR /app

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential curl git libpcre3 libpcre3-dev nginx

COPY requirements.txt /app/
RUN  pip install --no-cache-dir -r requirements.txt

COPY . /app    

RUN ln -s /app/viewer.conf /etc/nginx/sites-enabled && \
    rm /etc/nginx/sites-enabled/default && \
    export PYTHONPATH=$(pwd)/tractor:$PYTHONPATH && \
    export PYTHONPATH=$(pwd)/legacypipe/py:$PYTHONPATH && \
    export PYTHONPATH=$(pwd)/decals-web:$PYTHONPATH

EXPOSE 80

ENTRYPOINT ["/app/entry.sh"]
#CMD ["python3", "decals-web/manage.py", "runserver", "0.0.0.0:8000"]
