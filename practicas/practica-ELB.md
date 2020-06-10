Creamos un LB clasico y vamos a hacer que reparta cargas entre 3 instancias de EC2 (los que empiezan con ELB)

![](images/c5/practica-ELB/ec2.png)

Landing page de los servidores:

![](images/c5/practica-ELB/server 1.png)

1. Creamos un Load Balancer

1.1. Definimos el LB

![](images/c5/practica-ELB/step 1.png)

Este LB esta escuchando en protocolo HTTP puerto 80 desde internet, 
y la instancia y puerto al que escucha desde la VPC.

1.2. Asignar / Crear un security group

![](images/c5/practica-ELB/step 2.png)

Escucha para todas las direcciones desde puerto TCP 80

1.3. Configurar Chequeo de sanidad de instancias

![](images/c5/practica-ELB/step 4.png)

Como identifica el LB que las instancias estan sanas

1.4. Anadimos las instancias

![](images/c5/practica-ELB/step 5.png)

Tag, Review, create

![](images/c5/practica-ELB/review lb creation.png)

![](images/c5/practica-ELB/properties 1.png)

![](images/c5/practica-ELB/properties 2.png)

![](images/c5/practica-ELB/properties instances.png)


2. Creamos target group

![](images/c5/practica-ELB/TG.png)

3. Creamos un App LB

![](images/c5/practica-ELB/alb.png)

3.1 target group
Elijo uno solo y luego voy a elegir el resto:
![](images/c5/practica-ELB/routing.png)

3.2 register targets
![](images/c5/practica-ELB/targets register.png)

review, create

![](images/c5/practica-ELB/alb description.png)

![](images/c5/practica-ELB/alb listeners.png)

view / edit rules

![](images/c5/practica-ELB/alb listeners rules.png)

![](images/c5/practica-ELB/rules 1.png)

![](images/c5/practica-ELB/rules 2.png)

![](images/c5/practica-ELB/rules 3.png)

![](images/c5/practica-ELB/probando alb.png)