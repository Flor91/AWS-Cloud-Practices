# Práctica de Glue

> En esta práctica vamos a ver como usar utilizar este servicio de AWS para
> procesar información.

## Tarea 1: Crear un Crawler para cargar tablas en el catálogo de Glue

1. Ir a la consola de Glue y hacer click en “Databases” allí hacer click en “Add
   Database”:
   https://console.aws.amazon.com/glue/home?region=us-east-1#catalog:tab=databases

2. En la pantalla siguiente completar como nombre de la DB “clase-dh-[SUFIJO]”.
   Hecho eso podemos hacer click en “Create” para crear la nueva tabla:

3. Luego ir a “Crawlers” y hacer click en “Add Crawlers”:

4. En la pantalla siguiente completar “Crawler Name” con “DH Crawler Flights
   [SUFIJO]”. Luego clickear “Next”.
5. En la pantalla siguiente “Specify crawler source type” seleccionar “Data
   stores”. Luego clickear “Next”.
6. En la pantalla siguiente “Add a data store” completar lo siguiente y luego
   clickear “Next”: - Choose a data store: S3 - Crawl data in: Specified path in
   my account - Include path: s3://crawler-public-us-east-1/flight/2016/csv 7
   .En la pantalla siguiente “Add another data store” seleccionar “No” y luego
   clickear “Next”.
7. En la pantalla siguiente “Choose an IAM role” completar lo siguiente y luego
   clickear “Next”:
   - Choose an existing IAM role: AWSGlueServiceRole-DefaultRole
8. En la pantalla siguiente “Create a schedule for this crawler” completar lo
   siguiente y luego clickear “Next”:
   - Frequency: Run on Demand
9. En la pantalla siguiente “Configure the crawler's output” completar lo
   siguiente y luego clickear “Next”:
   - Database: clase-dh-[SUFIJO]
10. Finalmente se llega a la pantalla de review de configuraciones. Hacer click
    en “Finish”.

## Tarea 2: Correr el Crawler creado

1. Ir a la consola de Glue y hacer click en “Crawlers” allí seleccionar el
   crawler creado en el paso anterior y clickear “Run crawler”. El crawler
   debería quedar en estado “Running” luego de esto:

2. Cuando termine de correr en la pantalla “Databases” y seleccionar la base
   creada anteriormente.
3. Luego ir a “Tables” vamos a ver la tabla encontrada.

## Tarea 3: Consultar la tabla creada desde Athena

1. Ir a la consola de Athena y seleccionar la antes creada. Click en “Databases”
   allí hacer click seleccionar la DB que creamos usando el menú de la
   izquierda. https://console.aws.amazon.com/athena/home?region=us-east-1

2. Hecho esto podemos consultar los datos cargados con una query común y
   corriente:
   ```
   select * from csv limit 10;
   ```

## Tarea 4: Crear job y cargar data en una tabla nueva
