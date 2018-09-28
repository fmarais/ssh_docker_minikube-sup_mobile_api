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
echo "copy ${MOBILE_API_PROJECT_DIR}/Dockerfile to ${MOBILE_API_PROJECT_DIR}/Dockerfile.backup"
cp "${MOBILE_API_PROJECT_DIR}/Dockerfile" "${MOBILE_API_PROJECT_DIR}/Dockerfile.backup"

echo "copy ${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml to ${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml.backup"
cp "${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml" "${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml.backup"

# debug egg
echo "copy ${PYCHARM_DEBUG_EGG} to ${MOBILE_API_PROJECT_DIR}/src/pycharm-debug.egg"
cp "${PYCHARM_DEBUG_EGG}" "${MOBILE_API_PROJECT_DIR}/src/pycharm-debug.egg"

# copy in new config
echo "copy ${DEBUG_FILES_DIR}/Dockerfile to ${MOBILE_API_PROJECT_DIR}/Dockerfile"
cp "${DEBUG_FILES_DIR}/Dockerfile" "${MOBILE_API_PROJECT_DIR}/Dockerfile"

echo "copy ${DEBUG_FILES_DIR}/service.yml to ${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml"
cp "${DEBUG_FILES_DIR}/service.yml" "${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.ymld"

echo "Done!"