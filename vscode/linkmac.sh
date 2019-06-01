#!/usr/bin/bash -eu

vscodePath="/Users/rmcdono/Library/Application Support/Code/User"
for file in *.json; do
   targetFile = "${vscodePath}/${file}" 
   if [[ -e "${targetFile}" ]]; then
      mv "${targetFile}" "${targetFile}.bak"
   fi
   ln -s "${file}" "${vscodePath}/${file}"
done
