#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/andrea/Documenti/vision/Ultrascale/hls/OV7670_GRAYSCALE/OV7670_GRAYSCALE_prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
