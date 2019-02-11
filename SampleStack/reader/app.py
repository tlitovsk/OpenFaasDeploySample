from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    with open("/var/demo/access.txt","r") as f:
        count = f.read()
        return 'Reading from /var/demo/access.txt : {} \n'.format(count)
    return 'Not reading from file'

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
