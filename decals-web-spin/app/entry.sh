#!/bin/bash
export PYTHONPATH=$(pwd)/legacypipe/py:$PYTHONPATH && \
export PYTHONPATH=$(pwd)/tractor:$PYTHONPATH && \
export PYTHONPATH=$(pwd)/decals-web:$PYTHONPATH && \
cd decals-web
#service nginx start
uwsgi --ini uwsgi.ini
#python3 manage.py runserver 0.0.0.0:8000
