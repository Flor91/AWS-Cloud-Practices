# Apache Spark y AWS Glue
## Apache Spark
- Es un sistema general de procesamiento de datos a gran escala de forma distribuida.
- Creado en 2009 como un proyecto de research en UC Berkeley RAD Lab.
- Provee librerías para Scala, Java, Python y R para ejecutar este procesamiento de forma distribuído.
- Posibilita el procesamiento batch, interactivo, continuo e iterativo de forma eficiente.

### Componentes de Spark
![](images/19-spark-glue/9b35bc16.png)

### Ejecución en Apache Spark
![](images/19-spark-glue/8a8747ca.png)

### Motor unificado de procesamiento
![](images/19-spark-glue/4ee0c4b6.png)

### Ejecución en Apache Spark
![](images/19-spark-glue/767679d2.png)

### Resilient distributed datasets (RDDs)

![](images/19-spark-glue/9166407a.png)

– Colección inmutable de objetos.
– Particionada y distribuida.
– Almacenada en memoria (permite spill a disk).
– Las particiones se re-computan ante un fallo.

### Transformaciones vs Acciones

![](images/19-spark-glue/fb0a6e1a.png)

### Transformación
![](images/19-spark-glue/d2905d60.png)

### Grafo de RDDs y Tareas
![](images/19-spark-glue/c9eb8619.png)

### Ejecución de un programa de Spark
![](images/19-spark-glue/9c775432.png)

### Spark SQL
![](images/19-spark-glue/9be5422d.png)

### Spark SQL: load & save
![](images/19-spark-glue/f9984965.png)

## AWS Glue
### Data Lake & Data Warehouse en AWS

![](images/19-spark-glue/da540ac4.png)

### AWS Glue
![](images/19-spark-glue/cd4504dc.png)

![](images/19-spark-glue/c324eec0.png)

#### ETL: Job Properties
![](images/19-spark-glue/5c48cded.png)

#### ETL: Data Source
![](images/19-spark-glue/00e6c300.png)

#### ETL: Data Target
![](images/19-spark-glue/1ab5576f.png)

#### ETL: Create Data Target
![](images/19-spark-glue/82623274.png)

#### ETL: map fields
![](images/19-spark-glue/79940860.png)

#### AWS Glue
![](images/19-spark-glue/6887fd9a.png)

![](images/19-spark-glue/2de9ddc0.png)

### DynamicFrame
El esquema es a nivel de fila y no a nivel de tabla.

Un campo que cambia de string a int haría que un DataFrame común falle pero esto no pasa con DynamicFrame

Tiene métodos adicionales como resolve_choice o relationalize para tratar con tipos de datos cambiantes o anidados.

Se encuentra integrado con Data Catalog entonces se pueden utilizar conexiones definidas en el mismo de manera simple. 

### Job Bookmarks
Realiza un seguimiento de los datos que ya se han procesado durante una ejecución anterior de un trabajo de ETL mediante información de estado persistente de la ejecución del trabajo.

Limitaciones:
1. Concurrencia máxima de 1 en un job
2. Fuentes de S3 o jdbc
3. Debe utilizar job.commit()

### Endpoints de Desarrollo
Su objetivo es obtener una instancia de Glue dedicada.

Uno incurre en costos por cada hora que está prendido.

Se puede desarrollar en Spark con Scala o Python.

Para conectarse uno debe configurar un certificado SSL y puede hacerlo por SSH.

![](images/19-spark-glue/1b2e7c54.png)

#### Endpoints de Desarrollo
![](images/19-spark-glue/b52fb9dd.png)

![](images/19-spark-glue/21d12e7c.png)

#### Workflows
![](images/19-spark-glue/520041d8.png)

![](images/19-spark-glue/0959543b.png)