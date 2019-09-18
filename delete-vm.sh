#! /bin/bash

IMAGE_NAME=$VIRTUAL_MACHINE_NAME-image

# Delete a Compute Engine virtual machine
gcloud compute instances delete $VIRTUAL_MACHINE_NAME \
  --project $PROJECT \
  --zone $ZONE \
  --quiet

# Create the Image used to create the VM
gcloud compute images delete $IMAGE_NAME \
  --project $PROJECT \
  --quiet

# Print a user-friedly summary message
echo
echo
echo [$(date -u)]
echo ============================================================
echo If no error message was displayed, the Google Cloud Compute
echo Engine VM was sucessfully deleted!
echo ============================================================
