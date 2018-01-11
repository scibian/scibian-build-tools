CONF_DIR=/etc/scibian
CONF_DIR_BUILD=${CONF_DIR}/build
CONF_DIR_FEED=${CONF_DIR}/feed
WRAPPER_DIR=/usr/local/lib/scibian/exec
JOBS_DIR=/local00/jenkins-jobs

install:
	install --directory ${CONF_DIR}
	# sync-jobs
	install --directory ${CONF_DIR_BUILD}
	install --mode=0744 --owner=root --group=root sync-jobs/scibian-sync-jobs /usr/local/sbin
	install --mode=0644 sync-jobs/jobs.j2 ${CONF_DIR_BUILD}
	install --mode=0644 sync-jobs/cronjob /etc/cron.d/scibian-sync-jobs
	install --directory ${WRAPPER_DIR}
	install --mode=0744 sync-jobs/cron-wrapper.sh ${WRAPPER_DIR}/scibian-sync-jobs-cron-wrapper
	install --mode=0644 sync-jobs/job-templates.yaml ${JOBS_DIR}/job-templates.yaml
	# feed-gen
	install --directory ${CONF_DIR_FEED}
	install --mode=0644 feed-gen/*.j2 ${CONF_DIR_FEED}
	install --mode=0644 feed-gen/cronjob /etc/cron.d/scibian-pkgs-feed-generator
	install --mode=0744 feed-gen/pkgs-feed-generator ${WRAPPER_DIR}/pkgs-feed-generator
