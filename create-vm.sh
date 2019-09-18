#! /bin/bash

DISK_NAME=$VIRTUAL_MACHINE_NAME-disk
IMAGE_NAME=$VIRTUAL_MACHINE_NAME-image

# Create a Ubuntu 16.04 Boot Disk
gcloud compute disks create $DISK_NAME \
  --project $PROJECT \
  --zone $ZONE \
  --type pd-standard \
  --size 200GB \
  --image-family ubuntu-1604-lts \
  --image-project ubuntu-os-cloud

# Create an Image with VMX (nested virtualization) enabled
# https://cloud.google.com/compute/docs/instances/enable-nested-virtualization-vm-instances
gcloud compute images create $IMAGE_NAME \
  --project $PROJECT \
  --source-disk $DISK_NAME \
  --source-disk-zone $ZONE \
  --licenses "https://www.googleapis.com/compute/v1/projects/vm-options/global/licenses/enable-vmx"

# Delete the Disk once the Image has been created
gcloud compute disks delete $DISK_NAME \
  --project $PROJECT \
  --zone $ZONE \
  --quiet

# Create a Compute Engine virtual machine from the Image
gcloud compute instances create $VIRTUAL_MACHINE_NAME \
  --project $PROJECT \
  --zone $ZONE \
  --image $IMAGE_NAME \
  --machine-type n1-standard-4 \
  --min-cpu-platform "Intel Haswell" \
  --scopes https://www.googleapis.com/auth/cloud-platform \
  --metadata startup-script='#! /bin/bash
# Install virtualbox
sudo su -
apt-get update
apt-get upgrade -y
apt-get install -y virtualbox
'

# Print a user-friedly summary message
echo
echo
echo [$(date -u)]
echo ============================================================
echo If no error message was displayed, the Google Cloud Compute
echo Engine VM was sucessfully created!
echo
echo Wait ~5 minutes so VirtualBox install will finish, then
echo ssh to the VM and type \"VBoxManage -v\" to check the
echo installed version.
echo ============================================================
