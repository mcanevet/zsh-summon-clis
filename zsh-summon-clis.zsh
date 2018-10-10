[[ -z "$SUMMON_AWS_SECRETS_DIR" ]] && SUMMON_AWS_SECRETS_DIR=$HOME/aws
[[ -z "$SUMMON_OPENSTACK_SECRETS_DIR" ]] && SUMMON_OPENSTACK_SECRETS_DIR=$HOME/openstack

aws() {
	zparseopts -D -E -- -profile:=profile
	if [ -n "${profile}" ]; then
		summon -f $SUMMON_AWS_SECRETS_DIR/$profile[2]/secrets.yml /usr/bin/aws $@
	else
		/usr/bin/aws $@
	fi
}

openstack() {
	zparseopts -D -E -- -os-cloud:=cloud
	if [ -n "${cloud}" ]; then
		summon -f $SUMMON_OPENSTACK_SECRETS_DIR/$cloud[2]/secrets.yml /usr/bin/openstack $@
	else
		/usr/bin/openstack $@
	fi
}
