#!/usr/bin/env bash

APP="./app/helloworld/helloworld.py"
MANIFEST_DIR="./deploy/manifests"
TMP_DIR="./tmp"
EXISTING_INSTALL_MANIFEST="./deploy/install.yaml"
GENERATED_INSTALL_MANIFEST="./${TMP_DIR}/install.yaml"

# Create temporary directory
mkdir "${TMP_DIR}"

# Start with blank file
> "${GENERATED_INSTALL_MANIFEST}"

# Aggregate MagTape Application specific manifests
cat "${MANIFEST_DIR}/manifest1.yaml" >> "${GENERATED_INSTALL_MANIFEST}"
echo >> "${GENERATED_INSTALL_MANIFEST}"
echo "---" >> "${GENERATED_INSTALL_MANIFEST}"
cat "${MANIFEST_DIR}/manifest2.yaml" >> "${GENERATED_INSTALL_MANIFEST}"
echo >> "${GENERATED_INSTALL_MANIFEST}"
echo "---" >> "${GENERATED_INSTALL_MANIFEST}"
cat "${MANIFEST_DIR}/manifest3.yaml" >> "${GENERATED_INSTALL_MANIFEST}"
echo >> "${GENERATED_INSTALL_MANIFEST}"
echo "---" >> "${GENERATED_INSTALL_MANIFEST}"
cat "${MANIFEST_DIR}/manifest4.yaml" >> "${GENERATED_INSTALL_MANIFEST}"
echo >> "${GENERATED_INSTALL_MANIFEST}"
echo "---" >> "${GENERATED_INSTALL_MANIFEST}"


# Compare existing and generated manifest
if diff "${EXISTING_INSTALL_MANIFEST}" "${GENERATED_INSTALL_MANIFEST}"; then

    echo "No changes detected"
    EXIT_CODE=0

else

    echo "Changes detected in manifests. Please run \"make build-single-manifest\" to update install.yaml"
    EXIT_CODE=1

fi

# Cleanup temporary directory
rm -rf "${TMP_DIR}"

# Exit with appropriate code
exit "${EXIT_CODE}"