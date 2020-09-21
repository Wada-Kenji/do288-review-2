#!/bin/bash 

lab external-registry start
podman login -u ${RHT_OCP4_QUAY_USER} quay.io
echo "Input quay.io password"
skopeo copy \
   oci:/home/student/DO288/labs/external-registry/ubi-sleep \
   docker://quay.io/${RHT_OCP4_QUAY_USER}/ubi-sleep:1.0
podman logout quay.io
lab external-registry finish
