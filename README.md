# Marathon Consul Puppet Module

## Table of Contents

1. [Overview](#Overview)
1. [Support](#Support)
1. [Setup](#Setup)
    * [What the marathon_consul class affects](#What the marathon_consul class affects)
1. [Usage](#Usage)
    * [Install marathon-consul and setup service](#Install marathon-consul and setup service)
    * [Install marathon-consul with custom configuration parameters](#Install marathon-consul with custom configuration parameters)

## Overview

The marathon consul puppet module installs the marathon consul bridge software created by allegro which can be found [here](https://github.com/allegro/marathon-consul).  The marathon consul bridge creates consul services for each of your services running in Marathon.

## Support

This module is currently tested on:

* CentOS 7

## Setup

### What the marathon_consul class affects

* Downloads and unpackages the marathon-consul package from https://github.com/allegro/marathon-consul
* Extracts download to `/opt/marathon-consul-{version}`
* Configures settings in /etc/marathon-consul
* Takes the options hash provided and creates /etc/marathon-consul/marathon-consul.conf file
* Creates startup scripts for marathon-consul

## Usage

### Install marathon-consul and setup service

```puppet
class {'::marathon_consul':}
```

### Install marathon-consul with custom configuration parameters

All the configuration parameters for marathon-consul are supported as part of the options hash

```puppet
class {'::marathon_consul':
        options => {
                'marathon-location' => 'localhost:8080',
                'sync-interval'     => '5m',
                'log-level'         => 'debug',
        }
}
```
