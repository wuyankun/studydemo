#!/bin/bash
# ##########################################################
# ALPS(Android2.3 based) build environment profile setting
# ##########################################################
# Overwrite JAVA_HOME environment variable setting if already exists
JAVA_HOME=/home/ckt/work/env/jdk1.6.0_24
export JAVA_HOME

# Overwrite ANDROID_JAVA_HOME environment variable setting if already exists
ANDROID_JAVA_HOME=/home/ckt/work/env/jdk1.6.0_24
export ANDROID_JAVA_HOME

# Overwrite PATH environment setting for JDK & arm-eabi if already exists
PATH=/home/ckt/work/env/jdk1.6.0_24/bin:$PWD/prebuilt/linux-x86/toolchain/arm-linux-androideabi-4.4.x/bin:$PATH
export PATH

# Add MediaTek developed Python libraries path into PYTHONPATH
if [ -z "$PYTHONPATH" ]; then
  PYTHONPATH=$PWD/mediatek/build/tools
else
  PYTHONPATH=$PWD/mediatek/build/tools:$PYTHONPATH
fi
export PYTHONPATH

