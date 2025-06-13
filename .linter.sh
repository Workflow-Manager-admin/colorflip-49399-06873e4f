#!/bin/bash
cd /home/kavia/workspace/code-generation/colorflip-49399-06873e4f/colorflipperfrontend
npm run build
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
   exit 1
fi

