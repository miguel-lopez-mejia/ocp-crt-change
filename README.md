# bsi-restart-pods-sso.sh

Descripción
-

<p>Reinicio de pod´s 1 por 1: Lleva a cabo el reinicio 
de pod´s, lo primero que se va a realizar es limpiar la pantalla,
una vez hecho esto sacará una lista de pod´s (del más viejo al más nuevo)
para los cuales se va a realizar un reset, ahora crea una lista donde válida que se guardan
y una vez guardados se eliminan y se creará un pod nuevo, cuando 
este el pod nuevo ya solo esperaremos a que esté listo para su uso.
Ya por último solo regresa él pod nuevo con su nombre y que aún no está listo.</p>
<p>
Ejemplo:</p>
<pre>
Status - Tu contenedor ya está listo o no.
"Hace un loop hasta que este listo y pone el pod en una lista de terminados,
después lo descarta y continua el proceso."
</pre>

 <p><strong>Nota</p></strong>
 <p>
"Empieza él <code>for</code> con la lista que creamos solo con sso,
si son evicted son borrados, si no son evicted sacara otra vez 
la lista con sso, compara la lista y se realiza el proceso de reset,
guardando el pod nuevo"
</p>

Requerimientos
-

<p>Para ejecutar el script Restart necesitaremos:
</p>
<pre>
- Una sesión de Cluster.
- Una terminal(De linux, ya que el script solo se ejecuta en una terminal Linux).
- El OpenShift Client para su ejecución.
</pre>


Uso
-
<p>
- Abre la terminal de Linux y ubica el Script de reinicio de pod´s.
Una vez que lo encuentres ejecuta el comando:</p>
 <code>
./bsi-restart-pods-sso.sh</code>
<p> Se cuentan con las siguientes variables de las cuales solo el usuario podrá manipular <code>NS</code> y <code>PN</code>:</p>
<pre>
NS="seguridad-sso";
PN="sso";
statusTRUE="true";
statusFAIL="Failed";
statusEVIC="Evicted";
flagS="Red Hat Single Sign-On 7.3.8.GA (WildFly Core 6.0.27.Final-redhat-00001) started in";
</pre>


 






