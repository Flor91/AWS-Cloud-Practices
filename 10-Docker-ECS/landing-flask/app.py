#!/usr/bin/env python3
from flask import Flask, send_from_directory, render_template

app = Flask(__name__, static_url_path="", template_folder="")


@app.route("/js/<path:path>")
def send_js(path):
    return send_from_directory("js", path)


@app.route("/img/<path:path>")
def send_img(path):
    return send_from_directory("img", path)


@app.route("/css/<path:path>")
def send_css(path):
    return send_from_directory("css", path)


@app.route("/fonts/<path:path>")
def send_fonts(path):
    return send_from_directory("fonts", path)


@app.route("/", methods=["GET"])
def home():
    return render_template("/index.html", title="Landing page")


if __name__ == "__main__":
    app.run(host="0.0.0.0", debug=True)
