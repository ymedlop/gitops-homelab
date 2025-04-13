# Raspberry PI Cluster

This is a personal project to set a Kubernetes RPi cluster to provide me a private cloud for learning.

## Why k3s
[K3S](https://k3s.io/) is a highly available, certified Kubernetes distribution designed for production workloads in unattended, resource-constrained, remote locations or inside IoT appliances. Both ARM64 and ARMv7 are supported with binaries and multiarch images available for both.

## Prerequisites
<img align="right" width="100" height="100" src="images/cluster-draft.jpg">

* 6 SD card 32GB like [SanDisk 32GB ULTRA microSDHC Card Class 10](https://www.amazon.com/gp/product/B007JTKLEK/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B007JTKLEK&linkCode=as2&tag=alexellisuk-20&linkId=72069d86b6c70e1dc49c2f0ce35f08ef)
* 6 RPi 3b+ (1 Masters and 5 Worker)
* 8-way USB Power-supply
* 6 Micro-USB cables
* RPi 3B+,4B Cluster case like [8 Slot Cluster Cloud](https://www.ebay.de/itm/8-Slot-Cluster-Cloud-For-Raspberry-Pi-4B-3B-and-other-single-board-computers/123315692330?hash=item1cb630232a:m:mgb2CCUuG3V2u1RKG3BDyGg&var=423715705189)

## Getting started
For every RPi that we going to have in our cluster. We have to follow these steps:

### Choose your Cluster node names
I recommend you follow some kind of nomenclature in your nodes naming. It'll be helpful later when you are working with your cluster.
Because of the high availability feature with an embedded DB is experimental. I decided only to use one Master node in my cluster.

### Flash SD Card
* Download [Raspberry Pi Imager][(https://www.raspberrypi.org/downloads/raspbian](https://www.raspberrypi.com/software/)/)
* Open Raspberry Pi Imager
* Choose your device, SO (Raspberry Pi Os Lite (64-bit) and storage device
* Configure on settings the following parameters:
  * hostname  
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

