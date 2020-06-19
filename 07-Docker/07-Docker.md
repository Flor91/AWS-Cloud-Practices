# Docker 🐳

![](images/docker.png)

## El camino del desarrollador 🤓 ⚔
- “Rescatamos” algún proyecto previo.
- Instalamos dependencias que vamos necesitando.
- Configuramos variables de entorno.
- Agregamos archivos de configuración.
- Incorporamos assets: img, css, js.
- Resolvemos el problema.
- Y un dia lo tenemos que subir a la nube.

### Proyecto Node.js 
- Estructura del proyecto node
- Ejemplo del archivo `package.json`
- Comandos para instalar las dependencias, y para correr la aplicacion
![](images/nodejs.png)

### Proyecto Java
- Estructura del proyecto java
- Ejemplo del archivo `pom.xml`
- Comandos para instalar las dependencias, y para correr la aplicacion
![](images/java.png)

### Proyecto Python
- Estructura del proyecto python
- Ejemplo del archivo `requirements.txt`
- Comandos para instalar las dependencias, y para correr la aplicacion
![](images/python.png)

### Otras plataformas
- Proyectos .NET, PHP, Ruby, Go, etc. son similares.
- Nuestras aplicaciones además necesitan otros servidores y bases de datos para funcionar

![](images/otrasplataformas.png)

## Pasos para subir nuestra app a la nube
- Probamos que todo funcione bien en forma local.  `python app.py`
- Zipeamos el código fuente. `zip -r my-app.zip app.py`
- Instanciamos una máquina en EC2.  `aws ec2 run-instances...`
- Subimos el código.  `scp ubuntu@ec2-18-191-123-24.us-east-2...`
- Instalamos las dependencias.  `pip install -r requirements.txt`
- Rezamos para que no nos hayamos olvidado nada 🙏
- Corremos nuestro proyecto.  `python app.py`

¿Y si no funciona?

![](images/worksonmine.png)

![](images/docker-birth.png)

- Estos pasos pueden funcionar bien para deployar una vez, a un solo servidor
- ¿Si tenemos que replicar nuestra aplicación muchas veces?
- ¿Y si nos peleamos con el problema antes de subir a la nube?
- ¿Y si construimos el ambiente que necesita nuestra aplicación una sola vez?
- Esta es la propuesta de los containers.
- Llevar este ambiente de un entorno a otro, de local a producción.


## Docker
Nuestra ballena preferida al rescate: **Docker**
![](images/docker-bill.png)

### Virtualización
- ¿Por qué no virtualización? Ej. VirtualBox, VMware
    - Porque es pesada de recursos
    - Porque es difícil de administrarlas y actualizarlas

### Docker - Virtualizacion en Docker
- Docker permite que una máquina de base pueda compartir tiempo de CPU, Memoria y Disco con pequeñas máquinas llamados containers.
- Es mucho más óptimo que la Virtualización clásica porque no levanta un Sistema Operativo completo.

- Docker provee una forma de ejecutar software de forma segura, en un entorno aislado, empaquetado y con todas sus dependencias y librerías, esta instancia se conoce como contenedor.

![](images/docker-virtualization.png)
min 39:00 

##Propiedades de los contenedores 
- Un contenedor es un proceso del sistema operativo **autocontenido**.
- Se lanza a partir de una **imagen**.
- Esta imagen tiene **todo lo necesario** para que el contenedor pueda correr.
- No es necesario crear esta imagen a partir de un OS completo.
- Por lo tanto es mucho **más liviano** que una VM.
- Todos los contenedores son **independientes** entre sí y del entorno en el que corren.
- Permite **aprovechar mucho mejor los recursos** de hardware del host

## Arquitectura de Docker

![](images/architecture-docker.png)

[Documentación Docker](https://docs.docker.com/get-started/overview/)

## Docker Engine y Docker CLI
- Instalar Docker Community Edition (CE) - [Instalador](https://docs.docker.com/install/)
- Cliente / Servidor: Docker CLI / Docker Engine
- En Linux corre de forma nativa y comparte el kernel con sus containers.
- En Windows corre a través de Hyper-V.
- En Mac corre a través HyperKit.
- Previamente se corría mediante VirtualBox (Docker Toolbox).

## Docker: El contenedor.
Comparemos cómo se crean un proceso regular y un contenedor de Docker.

![](images/docker-container.png)

Un proceso regular del Sistema operativo se inicia a partir de un ejecutable (.exe), el cual fue compilado a partir de un código fuente. Similar para lenguajes interpretados.

![](images/container-2.png)

Para el caso de un contenedor, al código se le suman las dependencias, variables de entorno, archivos de configuración, etc. y crean un `Dockerfile`.

El Dockerfile es una lista de instrucciones que le pasamos al Docker Engine para que construya la imagen. 

![](images/docker-file.png)

Con el comando `docker build` le pasamos el Dockerfile al Docker Engine, que sigue las instrucciones para crear una Imagen de Docker que luego se usa para iniciar un contenedor. 

Un contenedor se construye a partir de un molde, este molde se conoce como imagen. 

![](images/docker-build.png)

Con la Imagen de Docker iniciamos un contenedor con `docker run`.

![](images/docker-run.png)

El nuevo contenedor va a correr junto a los demás contenedores que tenga dentro de mi Docker Engine.

Los contenedores están aislados los unos de los otros:

Docker Engine regula cuántos recursos asigna a cada uno.

Cada vez que corremos docker build creamos una imagen nueva

![](images/docker-container-run.png)

Podemos correr una imagen de Docker como un contenedor en otro sistema. Docker nos asegura que este nuevo contenedor va a correr como el original. 

![](images/docker-container-6.png)

Esta portabilidad permite resolver el problema de compatibilidad entre sistemas que tendríamos si quisiéramos correr el proceso directamente en otro sistema. 

![](images/docker-container-7.png)

## Arquitectura docker
![](images/arch-docker.png)

# Docker: Construcción de Imagen.
Un contenedor se construye a partir de un molde, este molde se conoce como imagen.

Una imagen es una colección de cambios sobre el sistema de archivos.

Una imagen contiene una unión de capas apiladas.
Cada capa hereda de la capa anterior.
Las imágenes son inmutables.
Los resultados intermedios pueden ser cacheados para un uso posterior.

![](images/docker-image.png)

Docker cuenta con un conjunto de instrucciones para la construcción de imagenes.
- El set instrucciones se suele agrupar en un archivo llamado Dockerfile.
- Estas instrucciones son ejecutadas al invocar el comando build
- Para la construcción de imágenes es necesario el Dockerfile y un contexto de construcción.
- El contexto de construcción es una carpeta local, o un repositorio tipo git.
- Este contexto puede contener archivos disponibles para la construcción, si es que es necesario.

