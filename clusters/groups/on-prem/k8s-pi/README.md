# Raspberry PI Cluster

This is a personal project to set a Kubernetes RPi cluster to provide me a private cloud for learning.

## Why k3s
[K3S](https://k3s.io/) is a highly available, certified Kubernetes distribution designed for production workloads in unattended, resource-constrained, remote locations or inside IoT appliances. Both ARM64 and ARMv7 are supported with binaries and multiarch images available for both.

## Prerequisites
* 6 SD card 32GB
* 6 RPi 3b+ (1 Masters and 5 Worker)
* 8-way USB Power-supply
* 6 Micro-USB cables
* RPi 3B+,4B Case Tower

## Getting started
For every RPi that we going to have in our cluster. We have to follow these steps:

### Flash SD Card
* Download [Raspberry Pi Imager][(https://www.raspberrypi.org/downloads/raspbian](https://www.raspberrypi.com/software/)/)
* Open Raspberry Pi Imager
* Choose your device, SO (Raspberry Pi Os Lite (64-bit) and storage device
* Configure on settings the following parameters:
  * hostname (I recommend you follow some kind of nomenclature in your nodes naming. It'll be helpful later when you are working with your cluster).
  * User and password
  * Wifi configuration
  * Enable SSH
* Flash the SD Card

### Customize the Raspberry
Insert the SD card and turn on your RPi. It will be accessible on your network over ssh using the following command:
```
ssh myuser@myraspberryhostname.local
```
Example:
```
ssh ymedlop@k8s-pi-01.local
```

