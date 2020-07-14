# AWS - Cloud Architect

![aws](resources/images/awscloud.svg)

El examen **AWS Certified Solutions Architect** - Associate está destinado a
personas que desempeñan la función de arquitecto de soluciones y tienen uno o
más años de experiencia práctica en el diseño de sistemas distribuidos
escalables, tolerantes a errores, rentables y disponibles en AWS.

Habilidades que se evalúan con la certificación

- Demostrar de manera eficiente el conocimiento necesario para diseñar la
  arquitectura de aplicaciones seguras y sólidas, y para implementarlas en las
  tecnologías de AWS
- Definir una solución mediante el uso de principios de diseño de arquitecturas
  basados en los requisitos del cliente
- Ofrecer pautas de implementación basadas en las prácticas recomendadas a la
  organización durante la duración del proyecto

---

## Temas:

### Modulo 1

1. [Introduccion a las tecnologias de la Nube ☁️](01-Introduccion-Cloud/01-Intro.md)

   - Introduccion
   - Que nubes hay
   - De donde surge la necesidad
   - Por que AWS
   - Modelo de pricing.

2. [Seguridad, IAM: Identity and Access Management, AWS CLI 👮](02-IAM-AWSCLI/02-Seguridad-IAM-CLI.md)

   - Seguridad
   - Aislamiento de ambientes
   - Complience
   - Servicio IAM (Permisos, Policies, Roles), como administrar distintos tipos
     de permisos
   - CLI (Command Line Interface)
   - Práctica:
     [Instalacion AWSCLI y algunos comandos](02-IAM-AWSCLI/2-practica-iam-awscli.md)

   ### Modulo 2

3. [EC2: Elastic Compute Cloud 🖥️](03-EC2/03-EC2.md)

   - Tipos de maquinas, casos para cada tipo
   - Redes
   - VPC
   - Práctica: [Levantar una web desde EC2](03-EC2/3-practica-EC2.pdf)

4. [S3: Simple Storage Service 🧳️](04-S3/04-S3.md)

   - Práctica: [Montar un sitio web estatico desde S3](04-S3/4-practica-S3.md)

5. [ELB: Elastic Load Balancing, ASG: Auto Scaling Groups ⚖️](05-ELB/05-ELB-ASG.md)

   - Autoscaling
   - Elastic Load Balancer
   - Práctica:
     [Montar un sitio web utilizando varias instancias EC2](05-ELB/5-practica-ELB.md)

6. [Route 53 📛](06-Route53/06-Route53.md)

   - Práctica: [Route 53](06-Route53/6-practica-Route53.md)

7. [Docker 🐳](07-Docker/07-Docker.md)

   - Práctica:
     [Comandos basicos Docker y DockerHub. Deployar App Docker en Elastic Beanstalk](07-Docker/docker.ipynb)

8. [ECS: Elastic Container Service 🗄](08-ECS/08-ECS.md)

   - Storage en Containers:
     - Volumes
     - Puntos de montaje
     - tmpfs
   - Docker Compose
   - [Hands-on Docker Storage y Docker Compose](08-ECS/Storage%20&%20Compose.ipynb)
   - [Practica ECS](08-ECS/ECS.ipynb)

9. [Network 🕸](09-Networking)

   - [Practica VPC](09-Networking/9-practica-networking.md)

10. [Docker + ECS 🐋](10-Docker-ECS/Repaso-ECS-Docker.md)

    - [Deploy Flask + Redis App](10-Docker-ECS/10-practica-docker.md)

    ### Modulo 3

11. [Automatizacion - Continuos Integration / Continuos Delivery 🚢](11-CI-CD/11-CI-CD.md)

    - [Practica Devops](11-CI-CD/11-practica-devops.md)

12. [Arquitectura de Microservicios, API Gateway, Lambda 🦠](12-Microservicios/12-microservicios.md)

    - [API REST utilizando los servicios API Gateway y Lambda](12-Microservicios/12-practica-microservicios.md)

13. [Arquitectura orientada a eventos](13-Eventos/13-arquitectura-eventos.md)

    - [Pipeline de procesamiento de eventos](13-Eventos/13-practica-eventos.md)

14. [RDS: Bases de datos relacionales](14-RDS/14-RDS.md)

15. Kubernetes
16. DynamoDB
17. Datalake
18. Glue Catalog, Crawler, Athena
19. EMR
20. ETL en AWS. Glue Jobs. DynamicFrames
21. Arquitecturas RT, Kinesis

    ### Modulo 4

22. Arquitectura de microservicios. API Gateway, CORS, Lambda
23. Arquitectura dirigida a eventos. S3, Lambda, SQS
24. Devops y Desarrollo. CloudFormation y CloudPipeline

    ### Modulo 5

25. Desarrollo y puesta en produccion de modelos de Machine Learning con
    SageMaker
26. Servicios de IA. Lex (Chatbot) y Rekognition (procesamiento de imagenes)
