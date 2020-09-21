#!/bin/bash -x

source /usr/local/etc/ocp4.config

lab external-registry start

podman login -u ${RHT_OCP4_QUAY_USER} quay.io

skopeo copy \
   oci:/home/student/DO288/labs/external-registry/ubi-sleep \
   docker://quay.io/${RHT_OCP4_QUAY_USER}/ubi-sleep:1.0

skopeo copy \
   docker://registry.access.redhat.com/rhscl/httpd-24-rhel7:2.4 \
   docker://quay.io/${RHT_OCP4_QUAY_USER}/httpd-new:1.0

podman logout quay.io

lab external-registry finish
