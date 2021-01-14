#!/bin/sh


TYP=$1
TLS_typ_CRT=TLS_${TYP}_CRT
TLS_typ_CAC=TLS_${TYP}_CAC
TLS_typ_KEY=TLS_${TYP}_KEY

SAV=$2
TLS_sav_CRT=TLS_${SAV}_CRT
TLS_sav_CAC=TLS_${SAV}_CAC
TLS_sav_KEY=TLS_${SAV}_KEY



if [[ $TYP == "new" ]]; then
  echo "Put new certs"
fi

if [[ $TYP == "ori" ]]; then
  echo "Put ori certs"
fi