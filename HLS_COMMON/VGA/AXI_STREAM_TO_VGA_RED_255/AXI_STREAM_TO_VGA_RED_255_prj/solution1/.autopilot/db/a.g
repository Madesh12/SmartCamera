#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/andrea/Documenti/vision/Ultrascale/hls/VGA/AXI_STREAM_TO_VGA_RED_255/AXI_STREAM_TO_VGA_RED_255_prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
