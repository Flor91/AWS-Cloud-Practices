import os
from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/")
def hello():
    return jsonify(message=f"Hello! I am a container in {os.environ.get('ENVIRONMENT')}")


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)