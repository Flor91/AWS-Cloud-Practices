# Big Data y Analytics 3

## Amazon EMR

### Enterprise Data Lake
 
![](images/18-big-data-analytics-3/80918e2b.png)

https://martinfowler.com/bliki/DataLake.html

https://martinfowler.com/articles/data-monolith-to-mesh.html

### Apache Hadoop
![](images/18-big-data-analytics-3/ed84d238.png)

### Amazon EMR
![](images/18-big-data-analytics-3/8f7fd897.png)

### Amazon Elastic Mapreduce
Plataforma de almacenamiento y procesamiento de grandes volúmenes de datos basada sobre Hadoop.

La plataforma es un software que se instalar por sobre instancias EC2 de Amazon Linux y se cobra un plus por sobre el valor de la instancia.

Permite instalar y utilizar de una manera simple una variedad de aplicaciones para procesamiento de grandes volúmenes de datos de manera escalable.

Para reducir costos soporta escalamiento (manual o automático), instancias spots, spot fleets y clusters transitivos con datos en S3.

![](images/18-big-data-analytics-3/df57cec3.png)

Master: contiene procesos que coordinan.
Core nodes: realizan procesamiento de datos y storage de datos mediante HDFS
Task nodes: nodos que solamente procesan datos.


#### Configuraciones de los nodos
![](images/18-big-data-analytics-3/e02258cd.png)

#### Aplicaciones Disponibles
![](images/18-big-data-analytics-3/ec06232b.png)

#### Opciones generales
![](images/18-big-data-analytics-3/a15729cf.png)

### Metastore Persistente
![](images/18-big-data-analytics-3/36fe1ffa.png)

### Modelo de Persistencia
![](images/18-big-data-analytics-3/ccdf3cfa.png)

### EMRFS
![](images/18-big-data-analytics-3/7d85e73c.png)

Consistencia de list-after-write y read-after-write con datos en S3.

Operaciones de listado de archivos en s3 más de 5x más rápidas.

Utilizar HDFS para workloads iterativos o caches

### Configurando aplicaciones (Presto)
![](images/18-big-data-analytics-3/6c7300b0.png)

### Acciones de Bootstrap
EMR permite correr scripts te bootstrap custom. No garantiza el orden de ejecución.

Se pueden utilizar para tunear límites del SO (nproc y nofile), instalar agentes de monitoreo o configurar las aplicaciones de forma más detallada.

![](images/18-big-data-analytics-3/72fb1c2f.png)

### Configurando aplicaciones (Presto)
![](images/18-big-data-analytics-3/eb7b1eb2.png)

## Data Lake & Data Warehouse en AWS
![](images/18-big-data-analytics-3/0a2f152c.png)

### AWS Analytics Portfolio
![](images/18-big-data-analytics-3/8c01a987.png)

### EMR Applications

#### Operaciones con HDFS
```shell script
% hdfs dfs -copyFromLocal|-put input/docs/quangle.txt \
hdfs://localhost/user/tom/quangle.txt
% hdfs dfs -copyToLocal|-get \
hdfs://localhost/user/tom/quangle.txt input/docs/quangle.txt
```

### Sqoop
![](images/18-big-data-analytics-3/f3024aca.png)

![](images/18-big-data-analytics-3/5c8b5956.png)

#### Sqoop Import
```shell script
$SQOOP_HOME/bin/sqoop import \
--append --check-column "modified_date" --incremental "lastmodified" \
--connect 'jdbc:mysql://db-host:3306/db' \
--username jpampliega --password-file '/user/hadoop/jpampliega-db.password' \
--table transactions --split-by "transaction_id" \
--direct -m 8 \
--hive-home "/home/hadoop/hive/" --hive-import \
--hive-table "staging.transactions" --null-string '\\N' --null-non-string
'\\N' \
--hive-partition-key day --hive-partition-value ${current_date} \
-- \
--skip-lock-tables --single-transaction --quick
```

### Hue
![](images/18-big-data-analytics-3/c0dd3d45.png)

### Hive Workflow
![](images/18-big-data-analytics-3/f02f3eed.png)

## DynamoDB

- Es un servicio de bases de datos NoSQL de formato key-value de alta disponibilidad ofrecido por Amazon.
- Fue uno de los primeros servicios en AWS de base de datos luego de SimpleDB y RDS.
- Surgió internamente en Amazon como una respuesta a como escalar una base de datos de manera simple para workloads operacionales (OLTP).
- No se puede consultar utilizando SQL salvo a través del conector de Hive pero esto implica un full scan.
- No es ideal para analytics.


### Esquema de las tablas
![](images/18-big-data-analytics-3/24f6ca17.png)

### Particiones
![](images/18-big-data-analytics-3/978516bf.png)

### Capacidad
![](images/18-big-data-analytics-3/d208331e.png)

### Amazon DynamoDB Streams
![](images/18-big-data-analytics-3/982f1aa6.png)