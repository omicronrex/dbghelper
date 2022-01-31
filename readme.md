# Debugger Helper

Debugger Helper is an automatic Game Maker Patch Tool for Windows 10, made using parts provided by Floogle and Samiboule, designed to replace the need to manually apply the other patch tools.

Currently supports patching GM Studio games with DBGHELP, and GM 7/8/8.1 games with gm8x_fix, fixing input lag and slowdowns. The tool will automatically patch studio's sleep margin to 1 as well, and has the ability to patch whole folders at once.

Added in version 0.4 is the new VPatch for GM 8.0 and 8.1 which will improve frame pacing when the monitor refresh rate is a multiple of the room speed, developed with immense help from [Floogle](https://github.com/skyfloogle). Additionally, VPatch also contains code to fix the key-release input lag present in gm8 engines.