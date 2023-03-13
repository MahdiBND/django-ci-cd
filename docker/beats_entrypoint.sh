echo "--> Starting beats process"
celery -A devopslearning.tasks worker -l info --without-gossip --without-mingle --without-heartbeat
