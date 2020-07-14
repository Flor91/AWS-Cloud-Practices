# Práctica de RDS

## Tarea 1: Crear una instancia RDS

En la consola de AWS en “Services” ir a RDS.

Luego seleccionar la opción “Databases”.

Hacer click en “Create database” y configurar las siguientes opciones:

- Engine type: MySQL
- Templates: Dev/Test

En la seccion “Setting”:

- DB instance identifier: my-rds
- Master username: alumno
- Master password: alumno2020
- Confirm password: alumno2020

En la seccion “DB instance size section”:

- Burstable classes: db.t2.micro

En la seccion “Availability & durability” opcion “Multi-AZ deployment”
seleccionar “Do not create a standby instance.”.

En la seccion “Connectivity”:

- Virtual Private Cloud (VPC): Elegir Develop (N. Virginia) o Default (Ohio)

En “Additional connectivity”

- Publicly accessible: No
- Existing VPC security groups: Dejar como esta.
- Security group: Default

En la seccion “Additional configuration”:

- Initial database name: lab

Desmarcar las siguientes opciones

- Enable automatic backups
- Enable Enhanced monitoring
- Enable auto minor version upgrade

Ir al final de la pantalla y hacer click en “Create database”.\
Luego de esto la instancia se va a crear luego de 10 minutos.

## Task 2: Levantar una instancia EC2 para conectarse

Levantar una instancia EC2 de clase t2.micro e instalar el cliente de mysql con
el siguiente comando:

```
$ yum install mysql
```

## Task 3: Ejecutar algunos comandos SQL desde la instancia

Ir a la página de RDS y revisar que la instancia esté disponible.

Esperar que la instancia creada aparezca como estado “Available”.

En la sección “Connectivity & security” copiar el nombre del endpoint.

Debería ser algo como esto:

`instancia-rds.hfhsdufh325.us-east-1.rds.amazonaws.com`

Conectarse a la instancia RDS y correr el siguiente comando para conectarse a la
base:

```
$ mysql --user alumno --password lab --host HOST
```

Hecho eso corre los siguientes comandos para verificar que la instancia
funciona:

```mysql
CREATE TABLE lab.staff (firstname text, lastname text, phone text);

INSERT INTO lab.staff VALUES ("John", "Smith", "555-1234");

 INSERT INTO lab.staff VALUES ("Sarah", "Jones", "555-8866");

SELECT * FROM lab.staff WHERE firstname = "Sarah";
```
