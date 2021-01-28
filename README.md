# jn-crt-change

Descripcion.
-
<p> 
Instala un certificado SSL a una lista de rutas de Openshift, 
y respalda la configuración de la ruta y los archivos del certificado actual de cada ruta de la lista.

Lo que realiza para el cambio de certificado es:<br>
Empieza guardando el certificado original (actual) y a su vez
el nuevo, una vez que se hayan guardado comienza a reescribir(aplicar)
el certificado original o el actual por el nuevo, dependiendo del
orden en que lo hayas puesto.
Finalmente comienza a leer el namespace y la ruta
en donde se encuentra el certificado para realizar la modificación 
del mismo. </p>


Requerimientos.
-
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

A su vez también necesitamos:  <br>
<pre>
- Una terminal.<br>
- Y el OpenShift Client para su ejecución.<br>
- Sesión de Cluster en donde se va a aplicar el certificado. 
</pre>

Uso.
-
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
    
Ahora empieza la aplicación del nuevo certificado, primero
con la parte de new, enseguida con el ori y al ultimo la parte
del certificado vacio (El cual solo contiene argumentos vacíos.),
no sin antes guardar los archivos de los directorios ori y new.<br>

"En donde guarda la configuración del certificado en un archivo .yml"

Finalmente - Leer namespace y ruta para modificar el cert.<br>
<p>"En donde toma el certificado y lo pone en la ruta, 
no sin antes realizar un respaldo de la configuración de la ruta,
creando una carpeta de backup, y por último saca el certificado de
la ruta y te imprime los datos del certificado nuevo"</p>



 






