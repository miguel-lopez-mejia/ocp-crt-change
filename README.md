## Change of certificate
<p> ocp-crt-change
 Change the routes in
           Certificate,
           CAcertificate and
           Key</p>
Use mode select:    

 -"new" Change/Save new cert.
 
 -"emp" Change/Save empty cert.
 
 -"ori" Change/Save the current cert.

Declare the actions to be taken later
-TYP=$1
-SAV=$2
#
#
The three commands that will help us save the files
<br>
-TLS_sav_CAC=TLS_${SAV}_CAC<br>
-TLS_sav_CRT=TLS_${SAV}_CRT<br>
-TLS_sav_KEY=TLS_${SAV}_KEY<br>
#
------------------------------------------------------------------------
And now the new certificate starts to be saved with all the files.<br>
-TLS_new_CRT=$(<crt_new/cert-new.crt)<br>
-TLS_new_CAC=$(<crt_new/CAcert-new.crt)<br>
-TLS_new_KEY=$(<crt_new/new.key)<br>
#
#

Then the original certificate will be saved.<br>
TLS_ori_CRT=$(<crt_ori/cert-ori.crt)<br>
TLS_ori_CAC=$(<crt_ori/CAcert-ori.crt)<br>
TLS_ori_KEY=$(<crt_ori/ori.key)<br>
#
#
 <p> Then the application of the certificates begins.<br>
1. First with the new.<br>
2. Then with the original.<br>
3. And finally with the empty certificate //That this only throws empty arguments<br>
</br>




Finally - Read namespace and route to modify the cert

 Run the command:
 
               *./change-cert.sh <change_select> <save_select>
 Example:
 
               *./change-cert.sh new ori


</p>
