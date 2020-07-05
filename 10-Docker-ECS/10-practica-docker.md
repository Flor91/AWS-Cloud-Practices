# Docker

## Contruccion de un container

1. Vamos a subir la pagina de `aspiration`, y servirlos vía container con su
   servidor preferido:

   - Node.js
   - **Flask**
   - nginx

   Elegimos un web para servir en cada uno de los servidores, creamos tres
   carpetas donde vamos a trabajar con cada uno, y copiamos el contenido de la
   web dentro de la carpeta correspondiente:

   - `landing-node`
   - `landing-flask`
   - `landing-nginx`

   Los archivos para crear los servidores y los containers de Docker estan mas
   abajo.

   Primero vamos a probarlos local parados desde cada una de las carpetas con:

   ```shell script
   docker build -t web-server .
   docker run -p 80:puerto web-server
   curl localhost
   ```

2. Taggearlo y subirlo a DockerHub.

   ```shell script
   docker tag webserver-flask fsilvestre/web-flask
   docker push fsilvestre/web-flask
   ```

3. Deployarlo en Elastic Beanstalk.

   - Zippeamos nuestro web server
   - Desde AWS Elastic Beanstalk creamos una nueva App
   - Seleccionamos `Webserver`
   - Nombramos nuestra app, seleccionamos que es tipo `Docker`
   - Subimos nuestro zip con el codigo, y le damos crear

4. Disponibilizarle un subdominio en `*.cloudarchitects.com.ar`

---

### NGINX Server

`Dockerfile`

```dockerfile
FROM nginx:latest
COPY . /usr/share/nginx/html
EXPOSE 80
```

### Flask Server

`app.py`

```python
#!/usr/bin/env python3
from flask import Flask, send_from_directory, render_template

app = Flask(__name__, static_url_path='', template_folder='')


@app.route('/js/<path:path>')
def send_js(path):
    return send_from_directory('js', path)


@app.route('/img/<path:path>')
def send_img(path):
    return send_from_directory('img', path)


@app.route('/css/<path:path>')
def send_css(path):
    return send_from_directory('css', path)


@app.route('/fonts/<path:path>')
def send_fonts(path):
    return send_from_directory('fonts', path)


@app.route('/', methods=['GET'])
def home():
    return render_template('/index.html', title='Landing page')


if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)

```

`requirements.txt`

```text
Flask
```

`Dockerfile`

```dockerfile
FROM python:3.6

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python", "app.py"]
```

### Node Server

`server.js`

```javascript
#!/usr/bin/env node
var express = require("express");
var app = express();

app.use(express.static(__dirname));

app.listen(5000);
console.log("Listening on port 5000");
```

`package.json`

```json
{
  "name": "photomedia",
  "version": "1.0.0",
  "description": "Simple template for course practices",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {
    "express": "4.17.1"
  },
  "author": "fsilvestre",
  "license": "ISC"
}
```

`Dockerfile`

```dockerfile
FROM node:lts-jessie

WORKDIR /app

COPY . /app

RUN npm install

EXPOSE 5000

CMD ["npm", "run", "start"]
```
