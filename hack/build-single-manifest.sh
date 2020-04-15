#!/usr/bin/env bash

APP="./app/helloworld/helloworld.py"
MANIFEST_DIR="./deploy/manifests"
INSTALL_MANIFEST="./deploy/install.yaml"

# Start with blank file
> "${INSTALL_MANIFEST}"

# Aggregate MagTape Application specific manifests
cat "${MANIFEST_DIR}/manifest1.yaml" >> "${INSTALL_MANIFEST}"
echo >> "${INSTALL_MANIFEST}"
echo "---" >> "${INSTALL_MANIFEST}"
cat "${MANIFEST_DIR}/manifest2.yaml" >> "${INSTALL_MANIFEST}"
echo >> "${INSTALL_MANIFEST}"
echo "---" >> "${INSTALL_MANIFEST}"
cat "${MANIFEST_DIR}/manifest3.yaml" >> "${INSTALL_MANIFEST}"
echo >> "${INSTALL_MANIFEST}"
echo "---" >> "${INSTALL_MANIFEST}"
cat "${MANIFEST_DIR}/manifest4.yaml" >> "${INSTALL_MANIFEST}"
echo >> "${INSTALL_MANIFEST}"
echo "---" >> "${INSTALL_MANIFEST}"