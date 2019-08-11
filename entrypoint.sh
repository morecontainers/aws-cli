#!/bin/sh

set -e

if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ]
then
	echo > /dev/stderr "error: AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY undefined"
	exit 1
fi

exec "$@"
