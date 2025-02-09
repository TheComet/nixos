#!/bin/sh
export QEMU_KERNEL_PARAMS="console=ttyS0"
export QEMU_NET_OPTS="hostfwd=tcp:127.0.0.1:2222-:22"  #,hostfwd=tcp:127.0.0.1:24680-:80"
./result/bin/run-nixos-vm -nographic; reset

