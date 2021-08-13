from flask import Flask

app = Flask(__name__)

@app.route("/image")
def get_image():
    return ""