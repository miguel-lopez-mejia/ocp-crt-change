
# ocp-crt-change

Descripcion.

<p> Lo que se realiza para el cambio de certificado es lo siguiente:<br>
Empieza guardando el certificado original (actual) y a su vez
el nuevo, una vez que se hayan guardado comienza a reescribir(aplicar)
el certificado original o el actual por el nuevo, dependiendo de
el orden en que lo hayas puesto.
Finalmente comienza a leer el namespace y la ruta
en donde se encuentra el certificado para realizar la modificacion 
del mismo. </p>


Requeriminetos.

Para realizar el cambio se necesita:<br>
Los directorios de:<br>
<strong>crt_ori(con sus respectivos archivos)</strong><br>
-cert-ori.crt<br>
-Cacert-ori.crt<br>
-ori.key<br>
-list<br>
Y tambien los directorios de:<br>
<strong>crt_new (con sus respectivos archivos)</strong><br>
-cert-new.crt<br>
-Cacert-new.crt<br>
-new.key<br>
<br>
A su vez tambien necesitamos:  <br>
- Una terminal.<br>
- Y el OpenShift Client para su ejecucion.<br>
- Sesion de Cluster en donde se va a aplicar el certificado. 


Uso.

Cambiar los certificados en las rutas de : <br>
           - Certificate<br>
           - CAcertificate and<br>
           - Key<br>

Modo de uso:<br>    

 -"new" Change/Save new cert.
 
 -"emp" Change/Save empty cert.
 
 -"ori" Change/Save the current cert.
 
 <p>"En donde el primer argumento es lo que se va a cambiar 
    y el segundo argumento lo que se va a respaldar"</p>

#
#
The three commands that will help us save the files
<br>
-TLS_sav_CAC=TLS_${SAV}_CAC<br>
-TLS_sav_CRT=TLS_${SAV}_CRT<br>
-TLS_sav_KEY=TLS_${SAV}_KEY<br>
#

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
  Then the application of the certificates begins.<br>
1. First with the new.<br>
2. Then with the original.<br>
3. And finally with the empty certificate //That this only throws empty arguments<br>
</br>




Finally - Read namespace and route to modify the cert

