from flask import Flask

app = Flask(__name__)
count = 0

@app.route('/')
def hello():
    global count 
    count = count + 1
    with open("/var/demo/access.txt","w") as f:
        f.write("{}".format(count))
        f.close()
        return "Writing {} to /var/demo/access.txt \n".format(count)
    return "Failed to write"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
