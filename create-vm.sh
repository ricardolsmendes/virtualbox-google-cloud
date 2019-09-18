# Create a Ubuntu 16.04 Boot Disk
gcloud compute disks create $VIRTUAL_MACHINE_NAME-disk \
   --type pd-standard \
   --size 200GB \
   --zone $ZONE \
   --image-family ubuntu-1604-lts \
   --image-project ubuntu-os-cloud

# Create an Image with VMX (nested virtualization) enabled
# https://cloud.google.com/compute/docs/instances/enable-nested-virtualization-vm-instances
gcloud compute images create $VIRTUAL_MACHINE_NAME-image \
  --source-disk $VIRTUAL_MACHINE_NAME-disk \
  --source-disk-zone $ZONE \
  --licenses "https://www.googleapis.com/compute/v1/projects/vm-options/global/licenses/enable-vmx"

# Delete the Disk once the Image has been created
gcloud compute disks delete $VIRTUAL_MACHINE_NAME-disk \
  --zone $ZONE \
  --quiet

# Create a Compute Engine virtual machine from the Image
gcloud compute instances create $VIRTUAL_MACHINE_NAME \
  --zone=$ZONE \
  --machine-type=n1-standard-4 \
  --image=$VIRTUAL_MACHINE_NAME-image \
  --min-cpu-platform "Intel Haswell" \
  --scopes=https://www.googleapis.com/auth/cloud-platform \
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
echo The Google Cloud Compute Engine VM was sucessfully created!
echo Wait ~5 minutes so VirtualBox install will finish, then
echo ssh to the VM and type \"VBoxManage -v\" to check the
echo installed version.
echo ============================================================
