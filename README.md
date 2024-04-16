# DevSpaces Base Image Repository

This repository contains the Containerfile and related resources for building a base image tailored for use with [Red Hat OpenShift Dev Spaces](https://developers.redhat.com/products/openshift-dev-spaces/overview). The image is designed to provide a robust and versatile development environment, integrating tools like Skaffold, Tekton CLI, Argo CD CLI, and Oh-My-ZSH.

[![GitHub Tag](https://img.shields.io/github/v/tag/smichard/devspaces_base_image "GitHub Tag")](https://github.com/smichard/devspaces_base_image/tags)
[![GitHub pull requests](https://img.shields.io/github/issues-pr-raw/smichard/devspaces_base_image "GitHub Pull Requests")](https://github.com/smichard/devspaces_base_image/pulls)
[![Container Registry on Quay](https://img.shields.io/badge/Quay-Container_Registry-46b9e5 "Container Registry on Quay")](https://quay.io/repository/michard/devspaces_base_image)
[![Start Dev Space](https://www.eclipse.org/che/contribute.svg)](https://devspaces.apps.ocp.michard.cc#https://github.com/smichard/devspaces_base_image)

## Table of Contents
- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Build Instructions](#build-instructions)
- [Tools Included](#tools-included)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This project aims to streamline the setup process for development environments, leveraging the power of containerization and Red Hat DevSpaces. It provides a pre-configured container image based on `registry.redhat.io/devspaces/udi-rhel8`, which includes a suite of essential development tools.

## Getting Started

To use this repository, ensure you have Podman / Docker installed and running on your machine. Clone this repository to your local machine to get started:

```bash
git clone https://github.com/smichard/devspaces_base_image.git
cd devspaces_base_image
```

## Build Instructions

To build the container image, run the following command in the root directory of this repository:

```bash
podman build -t devspaces-base-image .
```

## Tools Included

The Docker image includes the following tools:

- **ZSH:** A powerful shell that improves the command line experience.
- **Skaffold:** Simplifies Kubernetes application development and deployment.
- **Tekton CLI:** Command line interface for interacting with Tekton.
- **Argo CD CLI:** CLI for Argo CD, a declarative, GitOps continuous delivery tool for Kubernetes.
- **Oh-My-ZSH:** A delightful community-driven framework for managing your Zsh configuration.

## Contributing
Contributions to this project are welcome. Please ensure that your contributions adhere to the following guidelines:

- Write clear and descriptive commit messages.
- Create a new branch for each feature or bug fix.
- Ensure the build passes before submitting a pull request.

## License

This project is licensed under the [MIT License](./LICENSE). See the LICENSE file for more details.
