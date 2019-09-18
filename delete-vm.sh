# Delete a Compute Engine virtual machine
gcloud compute instances delete $VIRTUAL_MACHINE_NAME \
  --zone=$ZONE \
  --quiet

# Create the Image used to create the VM
gcloud compute images delete $VIRTUAL_MACHINE_NAME-image \
  --quiet

# Print a user-friedly summary message
echo
echo
echo [$(date -u)]
echo ============================================================
echo The Google Cloud Compute Engine VM was sucessfully deleted!
echo ============================================================
