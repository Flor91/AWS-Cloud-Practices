# AWS - Cloud Architect

![aws](resources/images/awscloud.svg)

El examen **AWS Certified Solutions Architect** - Associate está destinado a personas que desempeñan la función de arquitecto de soluciones y tienen uno o más años de experiencia práctica en el diseño de sistemas distribuidos escalables, tolerantes a errores, rentables y disponibles en AWS.

Habilidades que se evalúan con la certificación
- Demostrar de manera eficiente el conocimiento necesario para diseñar la arquitectura de aplicaciones seguras y sólidas, y para implementarlas en las tecnologías de AWS
- Definir una solución mediante el uso de principios de diseño de arquitecturas basados en los requisitos del cliente
- Ofrecer pautas de implementación basadas en las prácticas recomendadas a la organización durante la duración del proyecto

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
    - Servicio IAM (Permisos, Policies, Roles), como administrar distintos tipos de permisos
    - CLI (Command Line Interface)
    - Práctica: [Instalacion AWSCLI y algunos comandos](02-IAM-AWSCLI/2-practica-iam-awscli.md)

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
    - Práctica: [Montar un sitio web utilizando varias instancias EC2](05-ELB/5-practica-ELB.md)

6. [Route 53 📛](06-Route53/06-Route53.md)
    - Práctica: [Route 53](06-Route53/6-practica-Route53.md)

7. [Docker 🐳](07-Docker/07-Docker.md)
    - Práctica: [Comandos basicos Docker y DockerHub. Deployar App Docker en Elastic Beanstalk](07-Docker/docker.ipynb)

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

    ### Modulo 3
9. Kubernetes
10. RDS: Bases de datos relacionales
11. DynamoDB
12. Datalake
13. Glue Catalog, Crawler, Athena
14. EMR
15. ETL en AWS. Glue Jobs. DynamicFrames
16. Arquitecturas RT, Kinesis 

    ### Modulo 4
17. Arquitectura de microservicios. API Gateway, CORS, Lambda
18. Arquitectura dirigida a eventos. S3, Lambda, SQS
19. Devops y Desarrollo. CloudFormation y CloudPipeline

    ### Modulo 5
20. Desarrollo y puesta en produccion de modelos de Machine Learning con SageMaker
21. Servicios de IA. Lex (Chatbot) y Rekognition (procesamiento de imagenes)