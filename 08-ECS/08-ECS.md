# Amazon ECS
![](images/08-ECS/aws-ecs.png)

- ¿Como persisto datos desde un contenedor?
- ¿Si quiero correr varios contenedores en mi máquina?

## Persistencia
- Todo contenedor tiene asociado un sistema de archivos basado en el sistema operativo desde el que se construyó la imagen.
- Este sistema de archivos vive en memoria (rápido!) y todo cambio que hagamos durante la ejecución se guarda en una capa escribible del contenedor.
- Está fuertemente acoplado al contenedor que lo usa.
- Cuando el contenedor termina ya vimos que va a parar a algún lugar del disco del host.
- Es posible "resucitar" un contenedor terminado y recuperar sus archivos, pero no es lo más óptimo.
- Si eliminamos el contenedor, nuestros datos se van con él.

[Opciones de Storage](https://docs.docker.com/storage/)

## Volumenes
- La máquina host le cede una parte del disco que administra el Docker Engine (/var/lib/docker/volumes/ en Linux)
- Procesos que no sean de Docker no deberían escribir nada en esa parte. Es propiedad del root.
- Se pueden crear con o sin un contenedor que los use.
- Se pueden montar en varios contenedores.
- El container lo "ve" como un directorio más.
- Pueden ser nombrados o anónimos.
- Se borran solo cuando lo hacemos explícitamente.
- Ideal para cuando queremos correr nuestro container en la nube o en otro host.
- Nos podemos llevar este directorio de volumenes a otro host.
- https://docs.docker.com/storage/volumes/

### Puntos de Montaje
- Pueden ser cualquier parte del disco del host.
- El host le hace visible una parte de su sistema de archivos a un contenedor (cuidado! /root).
- Procesos que no sean de Docker pueden escribir en el punto de montaje.
- El contenedor también lo "ve" como un directorio más.
- Fuertemente acoplados a que la ruta exista en el host que corre el contenedor.
- No son tan flexibles como los volumenes y en general se desaconseja su uso.
- Se usan para compartir configuración con el contenedor, por ejemplo resolución de DNS (/etc/resolv.conf)
- Si estamos haciendo algún desarrollo y queremos reflejar un cambio en el código instantáneamente en el contenedor, le podriamos montar nuestra carpeta de archivos compilados o binarios.
- https://docs.docker.com/storage/bind-mounts/

#### tmpfs mounts
- Solo existen en memoria y nunca se escriben a disco.
- Ideal para caché o archivos sensibles.

#### ¿Como se usan?
- Creacion, listado y manipulación de volumenes: docker volume
- Montaje a la hora de arrancar un contenedor con el parámetro -v o --volume
- Iniciar con un contenedor con --tmpfs /app

##  Volumes & Bind Mounts

### Docker Compose
- Ningún contenedor anda solo por la vida.
- Docker Compose nos permite correr múltiples contenedores (probablemente de la misma aplicación) en el mismo Docker Engine.
- Los contenedores se configuran en archivos YAML como services
- Con un solo comando podemos levantar y administrar todos estos servicios
- Cada servicio puede ser una imagen de Docker local (basada en un Dockerfile) o remota (DockerHub o cualquier otro registro de Docker).
- Ideal para testear una aplicación completa en nuestra máquina antes de trasladarla a la nube y probarla con varias configuraciones distintas:
    - local, 
    - stage, 
    - production.

- Docker Compose crea una red interna entre todos estos servicios para que se vean entre si.
- Los atributos de cada service tienen su correspondiente en el docker run: 
    - Puertos, 
    - Variables de entorno, 
    - Volumenes.

## ECS
- Servicio de AWS de gestión de contenedores que nos permite poner en producción aplicaciones dockerizadas de forma escalable mediante un cluster administrado de instancias de EC2.
- Un cluster es un conjunto de máquinas que brindan un servicio y se manipulan como una unidad computacional única.
- No deberíamos preocuparnos donde deben correr físicamente los containers y resolver la conectividad entre ellos.

- Nos permite pensar nuestra aplicación como un conjunto de microservicios.
- AWS se encarga de gestionar en donde debe funcionar cada contenedor basado en los recursos del sistema u otros requisitos de disponibilidad.
- La idea es no asociar aplicaciones a instancias específicas de EC2, definir la configuración deseada y que ECS haga el resto.
- Se pueden mezclar distintos tipos de instancias de EC2.

- Se puede conectar con servicios de CI/CD.
- Se integra muy bien con otros recursos de AWS (ELB, Autoscaling, etc.).
- Solo se paga por los recursos que se usan, no por la gestión de los contenedores.

### Principales conceptos de ECS
- **Clusters**: Grupo de Instancias de Containers que actúan como una unidad computacional única.
- **Container** Instances: Una instancia EC2 que ha sido registrada en el Cluster.
- **Container Agent**: Es un componente que se instala en nuestra instancia y se encarga de registrarla en el Cluster.
- **Task Definitions**: Describe como una imagen docker de una aplicación debe correr, es un JSON similar a un YAML de Docker Compose.
- **Scheduler**: Determina donde un servicio o una tarea debe correr en el Cluster, descubriendo cual es la instancia más óptima.
- **Service**: Tareas que no finalizan, como un servidor web. Basado en una Task Definition, definimos cuántas instancias del servicio queremos correr y el Scheduler se va a encargar de monitorearlas y que estén siempre corriendo.
- **Task**: Son parecidos a los Services pero viven poco tiempo y tienen un final como por ejemplo trabajos batch. Se pueden correr una sola vez o como una tarea periódica.