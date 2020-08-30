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


## Contenido 

#### Domain 1: Design Resilient Architectures
1. Design a multi-tier architecture solution
2. Design highly available and/or fault-tolerant architectures
3. Design decoupling mechanisms using AWS services
4. Choose appropriate resilient storage

#### Domain 2: Design High-Performing Architectures
1. Identify elastic and scalable compute solutions for a workload
2. Select high-performing and scalable storage solutions for a workload
3. Select high-performing networking solutions for a workload
4. Choose high-performing database solutions for a workload

#### Domain 3: Design Secure Applications and Architectures
1. Design secure access to AWS resources
2. Design secure application tiers
3. Select appropriate data security options

#### Domain 4: Design Cost-Optimized Architectures
1. Identify cost-effective storage solutions
2. Identify cost-effective compute and database services
3. Design cost-optimized network architectures

---

## Clases Digital House:

### Modulo 1

1. [Introduccion a las tecnologias de la Nube ☁️](Digital-House/01-Introduccion-Cloud/01-Intro.md)

   - Introduccion
   - Que nubes hay
   - De donde surge la necesidad
   - Por que AWS
   - Modelo de pricing.

2. [Seguridad, IAM: Identity and Access Management, AWS CLI 👮](Digital-House/02-IAM-AWSCLI/02-Seguridad-IAM-CLI.md)

   - Seguridad
   - Aislamiento de ambientes
   - Complience
   - Servicio IAM (Permisos, Policies, Roles), como administrar distintos tipos
     de permisos
   - CLI (Command Line Interface)
   - Práctica:
     [Instalacion AWSCLI y algunos comandos](Digital-House/02-IAM-AWSCLI/2-practica-iam-awscli.md)

   ### Modulo 2

3. [EC2: Elastic Compute Cloud 🖥️](Digital-House/03-EC2/03-EC2.md)

   - Tipos de maquinas, casos para cada tipo
   - Redes
   - VPC
   - Práctica: [Levantar una web desde EC2](Digital-House/03-EC2/3-practica-EC2.pdf)

4. [S3: Simple Storage Service 🧳️](Digital-House/04-S3/04-S3.md)

   - Práctica: [Montar un sitio web estatico desde S3](Digital-House/04-S3/4-practica-S3.md)

5. [ELB: Elastic Load Balancing, ASG: Auto Scaling Groups ⚖️](Digital-House/05-ELB/05-ELB-ASG.md)

   - Autoscaling
   - Elastic Load Balancer
   - Práctica:
     [Montar un sitio web utilizando varias instancias EC2](Digital-House/05-ELB/5-practica-ELB.md)

6. [Route 53 📛](Digital-House/06-Route53/06-Route53.md)

   - Práctica: [Route 53](Digital-House/06-Route53/6-practica-Route53.md)

7. [Docker 🐳](Digital-House/07-Docker/07-Docker.md)

   - Práctica:
     [Comandos basicos Docker y DockerHub. Deployar App Docker en Elastic Beanstalk](Digital-House/07-Docker/docker.ipynb)

8. [ECS: Elastic Container Service 🗄](Digital-House/08-ECS/08-ECS.md)

   - Storage en Containers:
     - Volumes
     - Puntos de montaje
     - tmpfs
   - Docker Compose
   - [Hands-on Docker Storage y Docker Compose](Digital-House/08-ECS/Storage%20&%20Compose.ipynb)
   - [Practica ECS](Digital-House/08-ECS/ECS.ipynb)

9. [Network 🕸](Digital-House/09-Networking)

   - [Practica VPC](Digital-House/09-Networking/9-practica-networking.md)

10. [Docker + ECS 🐋](Digital-House/10-Docker-ECS/Repaso-ECS-Docker.md)

    - [Deploy Flask + Redis App](Digital-House/10-Docker-ECS/10-practica-docker.md)

    ### Modulo 3
11. [Automatizacion - Continuos Integration / Continuos Delivery 🚢](Digital-House/11-CI-CD/11-CI-CD.md)
    - [Practica Devops](Digital-House/11-CI-CD/11-practica-devops.md)
    
12. [Arquitectura de Microservicios, API Gateway, Lambda 🦠](Digital-House/12-Microservicios/12-microservicios.md)
    - [API REST utilizando los servicios API Gateway y Lambda](Digital-House/12-Microservicios/12-practica-microservicios.md) 

13. [Arquitectura orientada a eventos](Digital-House/13-Eventos/13-arquitectura-eventos.md)
    - [Pipeline de procesamiento de eventos](Digital-House/13-Eventos/13-practica-eventos.md)
    
14. [RDS: Bases de datos relacionales](Digital-House/14-RDS/14-RDS.md)
    - [Crear BD RDS Mysql y conectarse desde EC2](Digital-House/14-RDS/14-practica-RDS.md)

15. [Big Data y Analytics](Digital-House/15-BigData-Analytics/15-big-data.md)
    - [Redshift]

16. [Kinesis](Digital-House/16-Kinesis/16-kinesis.md)

17. [Big Data y Analytics II](Digital-House/17-BigData-Analytics-2/17-big-data-2.md)

18. [Big Data y Analytics III](Digital-House/18-BigData-Analytics-3/18-big-data-analytics-3.md)

19. [Spark y Glue](Digital-House/19-Spark-Glue/19-spark-glue.md)

20. [Lakeformation](Digital-House/20-Lakeformation/20-lakeformation.md)

21. [Sagemaker](Digital-House/20-Lakeformation/20-lakeformation.md)

22. [Rekognition](Digital-House/20-Lakeformation/20-lakeformation.md)

23. [Lex](Digital-House/20-Lakeformation/20-lakeformation.md)

24. [Kubernetes](Digital-House/20-Lakeformation/20-lakeformation.md)


---

## Ultimate AWS Certified Solutions Architect Associate 2020



---

## Other resources

- AWS Whitepapers & Cheat sheets
- Architecting for the AWS Cloud: Best Practices
- AWS Well-Architected Framework whitepaper
- AWS Storage & Content Delivery Services Cheat sheet
- AWS Compute Services Cheat Sheet
- AWS  Networking Services Cheat Sheet
- AWS  Database Services Cheat Sheet