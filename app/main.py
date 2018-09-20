from azureml.deploy import DeployClient

from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
  return 'Hello World!'

@app.route('/testpage')
def test():
  return 'Hello from test route!'

if __name__ == '__main__':
  app.run()