
# ocp-crt-change

Descripcion.
------------------------------------------------------------------------
<p> Lo que se realiza para el cambio de certificado es lo siguiente:<br>
Empieza guardando el certificado original (actual) y a su vez
el nuevo, una vez que se hayan guardado comienza a reescribir(aplicar)
el certificado original o el actual por el nuevo, dependiendo de
el orden en que lo hayas puesto.
Finalmente comienza a leer el namespace y la ruta
en donde se encuentra el certificado para realizar la modificacion 
del mismo. </p>


Requerimietos.
-------------------------------------------------------------
Para realizar el cambio se necesita:<br>
El directorio de:<br>
<strong>crt_ori(con sus respectivos archivos)</strong><br>
<pre>
- cert-ori.crt</li><br>
- Cacert-ori.crt</li><br>
- ori.key</li><br>
- list<br></pre>
Y tambien el directorio de:<br>
<strong>crt_new (con sus respectivos archivos)</strong><br>
<pre>
-cert-new.crt<br>
-Cacert-new.crt<br>
-new.key<br></pre>
<br>

A su vez tambien necesitamos:  <br>
<pre>
- Una terminal.<br>
- Y el OpenShift Client para su ejecucion.<br>
- Sesion de Cluster en donde se va a aplicar el certificado. 
</pre>

Uso.
-------------------------------------------------------------
Cambiar los certificados en las rutas de : <br>
      <pre>- Certificate< //Por parte del servidor <br>
           - CAcertificate//Por parte de la Autoridad de Certificacion<br>
           - Key//La llave del certificado
<br></pre>
Modo de uso:<br>    
<pre>
 -"new" Change/Save new cert.
    |
 (Nuevo)
 -"emp" Change/Save empty cert.
    |
 (Vacio)
 -"ori" Change/Save the current cert.
    |
 (Original o
  Actual)
 </pre>
 

<strong><p> Ejecutar el comando.:<br></strong>
<code>./change-cert.sh <change_select> <save_select></code><br>
"En donde el primer argumento es lo que se va a cambiar 
 y el segundo argumento lo que se va a respaldar"<br></p>
    <code>    Example:<br>
    ./change-cert.sh new ori</code><br>
    
Ahora la aplicacion del nuevo certificado empieza , 
are without before saving the files of the directories ori and new.<br>
<pre>
1. First with the new.<br>
2. Then with the original.<br>
3. And finally with the empty certificate //That this only throws empty arguments<br>
</br></pre>

"En donde guarda la configuracion del certificado en un archivo .yml"

Finalmente - Leer namespace y ruta para modificar el cert.<br>
<p>"En donde toma el certificado y lo pone en la ruta, 
no sin antes realizar un respaldo de la configuracion de la ruta,
creando una carpeta de backup, y por ultimo saca el certificado de
la ruta y te imprime los datos del certificado nuevo"</p>


 






