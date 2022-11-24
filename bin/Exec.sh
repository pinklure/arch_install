#!/usr/bin/env bash

function Exec() {
  eval "$*";
  code=$?;
  if [ ${code} != 0 ]; then
    echo ">> ERROR Exec: [$*] Failed.";
    exit ${code};
  else
    echo ">> TRACE Exec: [$*] Done.";
  fi
}