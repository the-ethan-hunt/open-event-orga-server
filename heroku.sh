#!/bin/bash
export INTEGRATE_SOCKETIO=false
#socketio has problems with celery blocking the taks
#turning socketio off  as it's not used in a celery task
celery worker -A app.celery --loglevel=info &
unset INTEGRATE_SOCKETIO
gunicorn app:app --worker-class eventlet -w 1
#define a separate worker and scale if not running on free dyno
