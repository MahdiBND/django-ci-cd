echo "--> Starting celery process"
celery -A devopslearning.tasks beat -l info --scheduler django_celery_beat.schedulers:DatabaseScheduler
