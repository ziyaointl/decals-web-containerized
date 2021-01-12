#!/bin/bash
export PYTHONPATH=$(pwd)/legacypipe/py:$PYTHONPATH
export PYTHONPATH=$(pwd)/tractor:$PYTHONPATH
export PYTHONPATH=$(pwd)/viewer:$PYTHONPATH
cd viewer
uwsgi --stats 127.0.0.1:1717 --touch-reload wsgi.py --ini uwsgi-rancher2.ini

#service nginx start
#python3 manage.py runserver 0.0.0.0:8000
