# Kubernetes <!-- omit in toc -->

- [Getting Started](#getting-started)
  - [macOS](#macos)

## Getting Started

### macOS

Using Docker:

```bash
## https://minikube.sigs.k8s.io/docs/drivers/docker/#Standard%20Docker
minikube start --driver=docker
```

Using QEMU:

```bash
## start network for QEMU driver
## https://minikube.sigs.k8s.io/docs/drivers/qemu/#socket_vmnet
sudo brew services start socket_vmnet

## start minikube using socket_vmnet for full network support
minikube start --driver qemu --network socket_vmnet
```
