# virtualbox-google-cloud

Shell scripts to create and delete a _Google Cloud Compute Engine virtual machine_ with
**Oracle VirtualBox** installed.

## Environment setup

```sh
export PROJECT=<GOOGLE-CLOUD-PROJECT-ID>
export ZONE=<GOOGLE-CLOUD-ZONE>
export VIRTUAL_MACHINE_NAME=<VIRTUAL-MACHINE-NAME>

chmod +x create-vm.sh
chmod +x delete-vm.sh
```

## Create a Compute Engine VM (an Image will also be created!)

```sh
sh create-vm.sh
```

## Delete the Compute Engine VM and its underlying Image

```sh
sh delete-vm.sh
```

**Please pay attention to the instructions printed while the scripts are running.**

## How to contribute

Please make sure to take a moment and read the [Code of
Conduct](https://github.com/ricardolsmendes/virtualbox-google-cloud/blob/master/.github/CODE_OF_CONDUCT.md).

### Report issues

Please report bugs and suggest features via the [GitHub
Issues](https://github.com/ricardolsmendes/virtualbox-google-cloud/issues).

Before opening an issue, search the tracker for possible duplicates. If you find a duplicate, please
add a comment saying that you encountered the problem as well.

### Contribute code

Please make sure to read the [Contributing
Guide](https://github.com/ricardolsmendes/virtualbox-google-cloud/blob/master/.github/CONTRIBUTING.md)
before making a pull request.
