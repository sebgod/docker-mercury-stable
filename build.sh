#!/bin/sh

sudo docker build -t sebgod/mercury-stable-hlb:${1-latest} .
