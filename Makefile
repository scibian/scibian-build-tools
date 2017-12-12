CONF_DIR=/etc/scibian/build
WRAPPER_DIR=/usr/local/lib/scibian/exec

install:
	install --directory ${CONF_DIR}
	install --mode=0744 --owner=root --group=root sync-jobs/scibian-sync-jobs /usr/local/sbin
	install --mode=0644 sync-jobs/jobs.j2 ${CONF_DIR}
	install --mode=0644 sync-jobs/cronjob /etc/cron.d/scibian-sync-jobs
	install --directory ${WRAPPER_DIR}
	install --mode=0744 sync-jobs/cron-wrapper.sh ${WRAPPER_DIR}/scibian-sync-jobs-cron-wrapper
