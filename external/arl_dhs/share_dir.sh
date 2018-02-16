#!/bin/bash
variable="$(find /home -mindepth 1 -maxdepth 1 -type d -not -name "share" | cut -c 7-)"
for name in $variable
do
  ln -sf /home/share /home/$name
done

