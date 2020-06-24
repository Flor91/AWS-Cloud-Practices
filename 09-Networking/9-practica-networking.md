# Practica Networking

1. Crear VPC en AWS
    - Ir a Services -> [VPC](https://console.aws.amazon.com/vpc/home?region=us-east-1#vpcs:sort=VpcId)
    - Your VPCs -> Create VPC
    > Nota: Pueden observar la cantidad de IPs que puedo obtener utilizando el rango /16
https://mxtoolbox.com/subnetcalculator.aspx

2. Crear subredes
    - Crear al menos 4 subredes, pueden elegir el CIDR que quieran, aunque para este ejercicio
utilizando barra /24 sería lo más sencillo para no estar calculando donde empiezan o
terminan las IPs.

    Utilizando un rango de /24 tenemos:
    - Subnets: 256
    - Hosts: 65024
    
    > Mas información acá: http://jodies.de/ipcalc?host=10.0.0.0&mask1=16&mask2=24

    - Elegir el VPC creado en el punto anterior y las subredes las vamos a elegir:
    ```
    subnet-public-01-bleiva
    10.0.0.0/24
    us-east-1a
    subnet-private-01-bleiva
    10.0.1.0/24
    us-east-1a
    subnet-public-02-bleiva
    10.0.2.0/24
    us-east-1b
    subnet-private-02-bleiva
    10.0.3.0/24
    us-east-1b
    ```

    - Ir a Subnets -> Crear Subnets

    - En las subredes públicas activar que asigne las IPs públicas:
        - Subnets > Modify auto-assign IP settings

3. Crear Internet Gateway
    - Para que nuestros servicios pueden ser accesibles desde internet necesitamos un IGW, por
ende iremos al panel de la izquierda -> Internet Gateways -> Create Internet Gateway

    - Luego en pantalla veremos en el menú de la derecha Actions -> Attach to VPC y elegiremos
el VPC creado en el punto 1 con nuestro nombre.

4. Crear Nat Gateways

    - Si necesitamos que nuestros servicios tengan acceso a internet pero que no sean
accesibles desde afuera, podemos utilizar los Nat Gateways y de esta manera agregar una
capa de seguridad.

    - Los Nat Gateway necesitan Elastic IP para que sean la puerta de salida, por ende primero
desde la interfaz misma de Nat Gateways podemos crear las Elastic IP.

    > Nota: Es muy importante ser organizados y manejar bien el uso de nomenclaturas
para nombrar los objetos, dado que en una infraestructura grande puede volverse
realmente caótico y confuso si no llaman las cosas adecuadamente.

5. Editar tablas de ruteo

    Vamos a mapear las subredes a sus correspondientes salidas:
    - Las subredes públicas, ambas saldrán por el mismo Internet Gateway
        - Crearemos una tabla de ruteo para las públicas
    - Las subredes privadas, cada una saldrá por su correspondiente Nat Gateway
        - Crearemos dos tablas de ruteo para las privadas

    Vamos a Route Tables:
    
    Identificamos la tabla de ruteo que vino con la creación de nuestro VPC

    La tabla de ruteo que vino con el VPC creado no la tocamos vamos a crear nuevas

    - Crear tabla de ruteo para las públicas:
        - Vamos a Create route Table
        - Ahora vamos a editar la tabla creada
        - Actions -> Edit Subnet Asociations 
        - Seleccionamos las subnets publicas

    - Vamos asociar el Internet Gateway creado en el paso 3 a esta tabla de ruteo creada:
        - Seleccionamos, Actions -> Edit Routes
        - En destination agregamos una con destino 0.0.0.0/0

    Ya tenemos la parte pública configurada. 
    
    - **Crear tablas de ruteo para las privadas**
        - `Create route Table` y creamos dos privadas
        - Editamos las tablas de a una
        - Actions -> Edit Subnet Asociations
        - Seleccionamos las subnet privada correspondiente para cada una

   Vamos a conectar los Nat Gateways a las subnets privadas:
        - Seleccionamos de a una las tablas de las redes privadas 
        - Vamos a Actions -> Edit Routes
        - Destination: 0.0.0.0/0
        - Target: seleccionamos Nat y el natgateway correspondiente
    
## Felicitaciones ha terminado de configurar su VPC

6. Bonus track

    ### **Ejercicio 0** 
    Es una pregunta, ¿por qué se imaginan que utilizo dos subnets privadas y sos subnets públicas?
    
    ### **Ejercicio 1**  
    Para verificar que el VPC está configurado correctamente, vamos a levantar 2 instancias micro de EC2, una en la subred pública y otra en la subred privada:
    
    Cuando eligen subnet, deberán elegir privada para la primera instancia y una subnet pública en la creación de la segunda instancia
    
    https://docs.aws.amazon.com/efs/latest/ug/gs-step-one-create-ec2-resources.html
    
    Vamos a acceder por SSH a la instancia pública y desde ahí ingresar a la instancia privada.
    
    Desde la privada utilicen wget o curl para descargarse una página y verificar que tienen acceso a internet.
    
    > Hint: Cuando se conecten a la instancia desde su máquina, carguen la pem en memoria y pasenla a la instancia pública de esa forma pueden ir saltando sin utilizar la pem en la privada
    
    ```
    ssh-add key.pem
    ssh -A
    ```
    
    ### **Ejercicio 2**
    
    Vamos a crear un endpoint para S3, crear un bucket y descargarlo desde la instancia de EC2
    
    https://docs.aws.amazon.com/vpc/latest/userguide/vpce-gateway.html
    
    ### **Ejercicio 3**
    
    Pueden crear una VPC con la misma arquitectura utilizando cloudformation:
    https://docs.aws.amazon.com/codebuild/latest/userguide/cloudformation-vpc-template.html
    