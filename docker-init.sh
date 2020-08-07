#!/usr/bin/env sh
RUN_CMD="$@"
useradd ${RUN_USER} -u ${RUN_UID} -s ${RUN_SHELL}
if [ -z "${RUN_CMD}" ]; then
  su ${RUN_USER}
else
  su  ${RUN_USER} -c "${RUN_CMD}"
fi
