# virtualbox-google-cloud
Shell scripts to create and delete a _Google Cloud Compute Engine virtual machine_ with __Oracle VirtualBox__ installed.

## Environment setup

```bash
export PROJECT=<GOOGLE-CLOUD-PROJECT-ID>
export ZONE=<GOOGLE-CLOUD-ZONE>
export VIRTUAL_MACHINE_NAME=<VIRTUAL-MACHINE-NAME>

chmod +x create-vm.sh
chmod +x delete-vm.sh
```

## Create a Compute Engine VM (an Image will also be created!)

```bash
sh create-vm.sh
```

## Delete the Compute Engine VM and its underlying Image

```bash
sh delete-vm.sh
```

__Please pay attention to the instructions printed while the scripts are running.__
