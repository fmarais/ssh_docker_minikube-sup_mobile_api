#!/usr/bin/env bash
# --------------------- EDIT THIS, START
PYCHARM_DIR="/Applications/PyCharm.app"
# pycharm helpers: /Applications/PyCharm.app/Contents/helpers/
# python 2
# debug egg: /Applications/PyCharm.app/Contents/debug-eggs/pycharm-debug.egg
# python 3
# debug egg: /Applications/PyCharm.app/Contents/debug-eggs/pycharm-debug-py3k.egg

MOBILE_API_PROJECT_DIR="/Users/francoismarais/projects/sup/mobile.superbalist.com"
DEBUG_FILES_DIR="/Users/francoismarais/Desktop/python debug/mobile-api"
# --------------------- EDIT THIS, END

# backups
echo "copy ${MOBILE_API_PROJECT_DIR}/Dockerfile to ${MOBILE_API_PROJECT_DIR}/Dockerfile.backup"
cp "${MOBILE_API_PROJECT_DIR}/Dockerfile" "${MOBILE_API_PROJECT_DIR}/Dockerfile.backup"

echo "copy ${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml to ${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml.backup"
cp "${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml" "${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml.backup"

# debug egg
echo "copy ${PYCHARM_DIR}/Contents/debug-eggs/pycharm-debug.egg to ${MOBILE_API_PROJECT_DIR}/src/pycharm-debug.egg"
cp "${PYCHARM_DIR}/Contents/debug-eggs/pycharm-debug.egg" "${MOBILE_API_PROJECT_DIR}/src/pycharm-debug.egg"

# copy in new config
echo "copy ${DEBUG_FILES_DIR}/Dockerfile to ${MOBILE_API_PROJECT_DIR}/Dockerfile"
cp "${DEBUG_FILES_DIR}/Dockerfile" "${MOBILE_API_PROJECT_DIR}/Dockerfile"

echo "copy ${DEBUG_FILES_DIR}/service.yml to ${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml"
cp "${DEBUG_FILES_DIR}/service.yml" "${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml"

# pycharm helpers
echo "copy ${PYCHARM_DIR}/Contents/helpers/ to ${MOBILE_API_PROJECT_DIR}/src/pycharm_helpers"
cp -r "${PYCHARM_DIR}/Contents/helpers/" "${MOBILE_API_PROJECT_DIR}/src/pycharm_helpers"

echo "Done!"