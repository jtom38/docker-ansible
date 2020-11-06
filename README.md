# docker-ansible

Ansible development environment and also for CI Pipelines.

## About

This image was made to have a common working environment for ansible development and CI pipelines.
The image comes with support for the following:

* [Ansible](www.ansible.com) (With support for VMware, Azure, and AWS)
* [Terraform](www.terraform.com)
* [Molecule](https://molecule.readthedocs.io/en/latest/)
* [Docker](www.docker.com)

## Pulling this Image

The images are stored in [Docker Hub](https://hub.docker.com/r/jtom38/ansible) and you can pull them down by the tag version.

## Using this image in VSCode

Make sure that you have [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) installed in VSCode and a working docker instance.

Here is an example of a devcontainer.json file to use this image.

```json
{
	"name": "Ansible Workspace",
	"image": "jtom38/ansible:2.10.3",
	"mounts": [
		"source=/var/run/docker.sock,target=/var/run/docker.sock,type=bind"
	],
	"settings": {
		"terminal.integrated.shell.linux": "/bin/bash"
	},
	"extensions": [
		"vscoss.vscode-ansible",
		"redhat.vscode-yaml",
		"ms-vscode.azurecli",
		"ms-azuretools.vscode-docker",
		"samuelcolvin.jinjahtml"
	],
	"postCreateCommand": "ansible --version && ansible-galaxy install -r requirements.yml",
}
```

## Building the images

This can be made locally using the makefile.
