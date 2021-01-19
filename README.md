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
<u>And now the new certificate starts to be saved with all the files</u>
#
#
#
<u>Then the original certificate will be saved</u>
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
