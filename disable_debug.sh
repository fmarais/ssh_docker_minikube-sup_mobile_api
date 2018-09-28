#!/usr/bin/env bash
# --------------------- EDIT THIS, START
#/Applications/PyCharm.app/Contents/debug-eggs/pycharm-debug.egg
# python 2
PYCHARM_DEBUG_EGG="/Applications/PyCharm.app/Contents/debug-eggs/pycharm-debug.egg"
# python 3
# PYCHARM_DEBUG_EGG="/Applications/PyCharm.app/Contents/debug-eggs/pycharm-debug-py3k.egg"
MOBILE_API_PROJECT_DIR="/Users/francoismarais/projects/sup/mobile.superbalist.com"
DEBUG_FILES_DIR="/Users/francoismarais/Desktop/python debug/mobile"
# --------------------- EDIT THIS, END

# backups
echo "mv ${MOBILE_API_PROJECT_DIR}/Dockerfile.backup to ${MOBILE_API_PROJECT_DIR}/Dockerfile"
mv "${MOBILE_API_PROJECT_DIR}/Dockerfile.backup" "${MOBILE_API_PROJECT_DIR}/Dockerfile"

echo "mv ${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml.backup to ${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml"
mv "${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml.backup" "${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml"

# add debug egg
echo "rm ${MOBILE_API_PROJECT_DIR}/pycharm-debug.egg"
rm "${MOBILE_API_PROJECT_DIR}/pycharm-debug.egg"

echo "Done!"