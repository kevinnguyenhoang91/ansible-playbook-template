#!/bin/bash

cat \
  <(echo -e "---") \
  <(cat roles/*/defaults/main.yml | grep -v '^---$' | grep -v '^[[:space:]]*$' | sed 's,---,,g') \
  > group_vars/_compiled_defaults.yml
