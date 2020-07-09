# Practica Arquitectura Orientada a Eventos

En esta práctica vamos crear e interactuar un pipeline de procesamiento de eventos.

## Tarea 1: Crear un tópico de SNS
1. Ir a la consola de SNS, abrir el menú de la izquierda y hacer click en “Topics”:
    https://console.aws.amazon.com/sns/v3/home?region=us-east-1#/dashboard

2. Luego hacer click en “Create Topic”. En esa pantalla completar:
    a. Name: s3_events_[SUFFIX]
    b. “Access policy - optional”: Añadir la siguiente pieza de código dentro de Statement:
    ```json
    {
    
          "Sid": "s3",
    
          "Effect": "Allow",
    
          "Principal": {
    
            "Service": "s3.amazonaws.com"
    
          },
    
          "Action": "SNS:Publish",
    
          "Resource": "arn:aws:sns:us-east-1:622305974757:s3_events_dabadie",
    
          "Condition": {
    
            "ArnLike": {
    
              "aws:SourceArn": "arn:aws:s3:*:*:dabadie-test"
    
            }
    
          }
    
        }
   ```
    Los valores en rojo son a modo de ejemplo. Completar con el ARN del tópico SNS y el nombre del bucket que crearán en la Tarea 2. Esto permitirá que las notificaciones generadas por el bucket puedan hacer uso del servicio SNS.

    ## Tarea 2: Configurar notificaciones de S3

3. Ir a la consola de S3 y hacer click en “Advanced settings > Events”:
    https://s3.console.aws.amazon.com/s3/buckets/iadh-2018/?region=us-east-1&tab=properties
4. Luego completar:
   - Name: event_arch_class_create_objects_[SUFFIX]
   - Events: Marcar “All object create events”
   - Prefix: event_arch_class_[SUFFIX]/
   - Send to: SNS Topic
   - SNS: s3_events_[SUFFIX]

## Tarea 3: Crear una lambda que procese el evento
1. Ir a la consola de Lambda y hacer click en “Create Function”:
https://console.aws.amazon.com/lambda/home?region=us-east-1#

2. Completar lo siguiente:
    - Function name: process_s3_events_[SUFFIX]
    - RuntimeInfo: Python 3.8
     
     Luego create function.

3. Hacer click en “Add trigger” en la sección izquierda de la pantalla..
    - En la pantalla siguiente seleccionar SNS
    - En “SNS Topic” seleccionar s3_events_[SUFFIX]
    - Luego hacer click en “Add“ para volver a la pantalla anterior.

4. Completar “Function code” con el siguiente código al archivo “lambda_function.py” (abierto por default):

```python
import json

print('Loading function')

def lambda_handler(event, context):

    #print("Received event: " + json.dumps(event, indent=2))
    message = event['Records'][0]['Sns']['Message']
    print("From SNS: " + message)
    return message
```

5. Finalmente hacer click en “Save” para crear la Lambda.

La Lambda se pueden probar de manera rápida con los siguientes pasos:

1. Ir a la conf de la misma y hacer click en “Test”.
2. En la pantalla siguiente seleccionar:
    - Event template: Amazon SNS Topic Notification. Esto va a cargar un template del contenido de un evento generado por un mensaje de SNS.
    - Event name: testS3Event
3. Hecho esto seleccionar el ejemplo creado del box situado a la izquierda del botón “Test” y hacer click en test. A continuación debería mostrarse un box con el resultado de la ejecución.

## Tarea 4: Probar que los mensajes llegan del tópico SNS a la Lambda.
1. Ir a la consola de SNS.
2. Ir a “Topics“ y allí seleccionar el topic creado anteriormente.
    
    Notar que ahora deberíamos ver en la sección “Subscriptions” una referencia a la Lambda que dejamos configurada.

3. Hacer click en “Publish Message”
4. En “Message body => Message body to send to the endpoint” completar con “HOLA LAMBDA”. Luego hacer click en “Publish Message“ al pie de la pagina.
5. Luego de eso volver a la consola de Lambdas y entrar a la lambda que creamos.
6. Desde ahí navegar por “Monitoring” e ir a la sección “Recent Invocations” final de la página donde debería aparecer la última llamada a la Lambda que fue disparada por el mensaje de SNS.
    
    Haciendo click en la celda que corresponde a la columna “LogStreams” pueden llegar a los log específicos y ver el mensaje con el que venía la lambda.
    
    Esta misma información se puede ver en Cloudwatch yendo a “View logs in CloudWatch”.

## Tarea 5: Cargar un archivo en S3 y validar si la Lambda funciona

Este punto consiste en crear un objeto nuevo en S3 en el path “event_arch_class_[SUFFIX]” de la manera que se prefiera (por UI, CLI o Python+boto) y revisar si efectivamente se generó el mensaje y se realizó la llamada a la Lambda.

## Tarea 6: Enviar un SMS utilizando SNS

Buscar la forma de enviar un SMS cuando llegue un mensaje al tópico.