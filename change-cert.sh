#!/bin/sh
# Change the routes in
#           Certificate,
#           CAcertificate and
#           Key
#
# Use mode select:      "new" Change/Save new cert.
#                       "emp" Change/Save empty cert.
#                       "ori" Change/Save the current cert.
#
# Run the command:
#               ./change-cert.sh <change_select> <save_select>
# Example:
#               ./change-cert.sh new ori
#
#################################################################

TYP=$1
SAV=$2

TLS_sav_CAC=TLS_${SAV}_CAC
TLS_sav_CRT=TLS_${SAV}_CRT
TLS_sav_KEY=TLS_${SAV}_KEY

# New CERT SAVES
TLS_new_CRT=$(<crt_new/cert-new.crt)
TLS_new_CAC=$(<crt_new/CAcert-new.crt)
TLS_new_KEY=$(<crt_new/new.key)
TLS_new_CRT="${TLS_new_CRT//$'\n'/\\\n}"
TLS_new_CAC="${TLS_new_CAC//$'\n'/\\\n}"
TLS_new_KEY="${TLS_new_KEY//$'\n'/\\\n}"

# Ori CERT SAVES
TLS_ori_CRT=$(<crt_ori/cert-ori.crt)
TLS_ori_CAC=$(<crt_ori/CAcert-ori.crt)
TLS_ori_KEY=$(<crt_ori/ori.key)
TLS_ori_CRT="${TLS_ori_CRT//$'\n'/\\\n}"
TLS_ori_CAC="${TLS_ori_CAC//$'\n'/\\\n}"
TLS_ori_KEY="${TLS_ori_KEY//$'\n'/\\\n}"

# Apply new cert
if [[ $TYP == "new" ]]; then
        TLS_typ_CRT=$TLS_new_CRT
        TLS_typ_CAC=$TLS_new_CAC
        TLS_typ_KEY=$TLS_new_KEY
fi

# Apply ori cert
if [[ $TYP == "ori" ]]; then
        TLS_typ_CRT=$TLS_ori_CRT
        TLS_typ_CAC=$TLS_ori_CAC
        TLS_typ_KEY=$TLS_ori_KEY
fi

# Apply emp cert
if [[ $TYP == "emp" ]]; then
        TLS_typ_CRT=""
        TLS_typ_CAC=""
        TLS_typ_KEY=""
fi

# Read namespace and route to modify the cert
while read -r line; do

namespace=`echo $line | cut -d ' ' -f 1`
route=`echo $line | cut -d ' ' -f 2`

echo -e "Namespace: $namespace \t\t\t Route: $route"

oc -n $namespace get routes $route -o yaml                                   > crt_bkp/${namespace}_routes_${route}_$(date +%s).yaml
oc -n $namespace get routes $route -o json | jq -r ".spec.tls.caCertificate" > crt_bkp/${namespace}_routes_${route}-${TLS_sav_CAC}-$(date +%s).crt
oc -n $namespace get routes $route -o json | jq -r ".spec.tls.certificate"   > crt_bkp/${namespace}_routes_${route}-${TLS_sav_CRT}-$(date +%s).crt
oc -n $namespace get routes $route -o json | jq -r ".spec.tls.key"           > crt_bkp/${namespace}_routes_${route}-${TLS_sav_KEY}-$(date +%s).key

kubectl -n $namespace patch route $route                                    \
        -p "{\"spec\":{\"tls\":{\"caCertificate\":\"${TLS_typ_CAC}\",
                                  \"certificate\":\"${TLS_typ_CRT}\",
                                          \"key\":\"${TLS_typ_KEY}\"}}}"

done < list