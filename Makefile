CONF_DIR=/etc/scibian/build

install:
	install --directory ${CONF_DIR}
	install --mode=0744 --owner=root --group=root sync-jobs/scibian-sync-jobs /usr/local/sbin
	install --mode=0644 sync-jobs/jobs.j2 ${CONF_DIR}
	install --mode=0644 sync-jobs/cronjob /etc/cron.d/scibian-sync-jobs
