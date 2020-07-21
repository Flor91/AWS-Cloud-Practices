# Big Data y Analytics 2

## Hadoop, Hive & Presto
### Enterprise Data Lake
![](images/17-big-data-2/20e0dbff.png)

https://martinfowler.com/bliki/DataLake.html
https://martinfowler.com/articles/data-monolith-to-mesh.html

### Apache Hadoop
![](images/17-big-data-2/71d020a4.png)

### Apache Hadoop 2

![](images/17-big-data-2/568b0da3.png)

## Apache Hive
Es un sistema de Data Warehouse sobre Hadoop desarrollado por Facebook inicialmente en 2008.
Recibe consultas SQL (HiveQL) y las convierte a tareas de Map-Reduce (o similar) y las ejecuta distribuídas en el cluster de Hadoop sobre HDFS.

![](images/17-big-data-2/cb2635e6.png)

Hive posee un sistema llamado Metastore donde almacena los metadatos de cada tabla en una RDBMS (MySQL, Postgres, Oracle).

Las consultas operan sobre tablas creadas en el Metastore de Hive.

Los datos de la tabla se almacenan en paths en HDFS u otros filesystems soportados como S3. Terminan siendo archivos en directorios con el formato de la tabla.

![](images/17-big-data-2/e3e28542.png)

### Apache Hive: Particiones
Las tablas pueden tener particiones sobre ciertos campos que terminan reflejándose como subdirectorios debajo del directorio principal de la tabla.
Al filtrar por ciertos valores por esos campos se evita leer todos los subdirectorios.

![](images/17-big-data-2/e37ed1f4.png)

### Apache Hive: CREATE TABLE

![](images/17-big-data-2/add34ca4.png)

### Apache Hive: Particiones

![](images/17-big-data-2/b8e07f5c.png)

### Apache Hive: INSERT

![](images/17-big-data-2/688d564f.png)

## MPP sobre HDFS

Sistemas Open Source de Procesamiento Paralelo Masivo.

Inicialmente hechos para correr sobre Hadoop y priorizar velocidad sobre estabilidad.

Basados en el paper de Google Dremel (BigQuery)

Gran ganancia de performance con formatos columnas para sumarizaciones.

Inestables para JOINs grandes e INSERTs.

### PrestoSQL

Motor masivo paralelo compatible con ANSI SQL (window functions, with, UDFs, etc).

Desarrollado por Facebook como evolución a Hive. Corre sobre la JVM.

![](images/17-big-data-2/a07c86f4.png)

#### PrestoSQL Arquitectura

![](images/17-big-data-2/0d0b5dbe.png)

# Data Lake & Data Warehouse en AWS

![](images/17-big-data-2/52db3667.png)

## AWS Analytics Portfolio

![](images/17-big-data-2/9dcfb90b.png)

# Athena y Glue Catalog
Es un servicio serverless de consultas interactivo que facilita el análisis de datos en Amazon S3 con SQL estándar y no requiere ETLs.

Sólo se paga por las consulta unos 5 U$D por TB de datos escaneado.

Se cobra por la cantidad de bytes escaneados por redondeados al megabyte más cercano, con 10 MB mínimo por consulta.

No se cobran por operaciones de DDL, particiones o consultas fallidas.

No permite utilizar conectores que no consulten a S3

Soporta formatos como como CSV, JSON, ORC, Avro o Parquet

Soporta INSERTs desde 2019 pero no OVERWRITE.

Integración con IAM.

Resultados de una query se almacenan en S3.

API REST. Librerías en los principales lenguajes.

### AWS Glue Catalog

![](images/17-big-data-2/15a8ddb9.png)

### Glue Crawlers

![](images/17-big-data-2/b55be6d4.png)

## S3 Select
Es una API de AWS que permite realizar consultas SQL simples sobre archivos en S3 sin necesidad de descargarlos:

- Soporta CSV, JSON, and Parquet con o sin compresión GZIP o BZIP2
- Se pueden hacer consultas a S3 Glacier de manera no interactiva
- Solo soporta cláusulas SELECT, FROM, WHERE y LIMIT
- No soporta subqueries o JOINs 

![](images/17-big-data-2/9283103c.png)

