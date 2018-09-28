## How to

`enable_debug.sh` will copy in the modified files to open the required ports and install the sshd service in the container

`disable_debug.sh` will undo all the debug changes

please edit `enable_debug.sh` and `disable_debug.sh` paths as required for your local env<br>

`PYCHARM_DEBUG_EGG`<br>
`MOBILE_API_PROJECT_DIR`<br>
`DEBUG_FILES_DIR`

1. remove the service before you deploy as there will be new ports exposed
`kbectl delete svc mobile-api`

2. then deploy
`make deploy`

3. refresh the pod
`kubectl delete pod -l app=mobile`
