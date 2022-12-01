#!/usr/bin/env bash

function Exec() {
  eval "$*";
  code=$?;
  if [ ${code} != 0 ]; then
    echo ">> Error: [$*] Failed.";
    exit ${code};
  else
    echo ">> Trace: [$*] Done.";
  fi
}


function Invoke() {
    if [ $# == 0 ]; then
     echo ">> ERROR Invoke: No Input Function Name.";
     exit -1;
    fi
    
    echo ">>>> ${1} Begin.";
    Exec "$*";
    echo ">>>> ${1} Done.";
}