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
echo "mv ${MOBILE_API_PROJECT_DIR}/Dockerfile.backup to ${MOBILE_API_PROJECT_DIR}/Dockerfile"
mv "${MOBILE_API_PROJECT_DIR}/Dockerfile.backup" "${MOBILE_API_PROJECT_DIR}/Dockerfile"

echo "mv ${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml.backup to ${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml"
mv "${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml.backup" "${MOBILE_API_PROJECT_DIR}/kubernetes/dev/service.yml"

# debug egg
echo "rm ${MOBILE_API_PROJECT_DIR}/src/pycharm-debug.egg"
rm "${MOBILE_API_PROJECT_DIR}/src/pycharm-debug.egg"

# pycharm helpers
echo "rm ${MOBILE_API_PROJECT_DIR}/src/pycharm_helpers"
rm -r "${MOBILE_API_PROJECT_DIR}/src/pycharm_helpers"

echo "Done!"