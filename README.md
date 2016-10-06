nodemcu-ds18b20-mqtt
======================

[![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)](LICENSE.md)

Simple example on how to stream DS18B20 temperature readings to a MQTT broker.
I am using [Node-RED](nodered.org) to forward the values, e.g. to a ThingSpeak account.

### Requirements

You need a NodeMCU firmware with the mqtt module and floating-point support.

### Setup

Copy ```config.template.lua``` to ```config.lua``` and adapt as needed.

### Disclaimer

Most of the source code originates from a [blog post](http://www.foobarflies.io/a-simple-connected-object-with-nodemcu-and-mqtt) by Cyril.

The DS18B20 module contains license information (MIT license).

