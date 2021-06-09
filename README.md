# chibios-openocd-demo

-- DESCRIPTION --
ChibiOS demo targeting STM32F091RC Nucleo development board, this tiny project includes an invocation to openocd to program the dev board, in an Ubuntu 20.04 LTS environment.

Also tested in Linux Mint 18 (Ubuntu 18.04 LTS) environment, very similar.

-- GOAL --
Developer Ted's goal with these files is to provide a reasonable way with few steps to test GNU gcc ARM cross compiler, and openocd programmer and debugger tools on Unix and Linux hosts.  Openocd can talk to a variety of hardware programmers and debuggers, and a given Unix or Linux distribution is likely to require distro-specific drivers for given hardware programmers.  The tracking down and install of those drivers lies outside the scope of this tiny project, but once such drivers are installed, this project may be modified to have `openocd` call a specific hardware programmer and or debugger, and in this way test the cross compiler, openocd, and the given device drivers of the developer's programmer.

-- STATUS --
As of 2021-06-09 this work is new and just beginning.  This set of files is not a "stand alone" or complete demonstration, but depends upon the sources of present stable ChibiOS release, version 20.3.3.
