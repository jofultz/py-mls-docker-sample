#begin guidedres.py imports
import dash
import dash_core_components as dcc
import dash_html_components as html
import dash_dangerously_set_inner_html
from dash.dependencies import Input, Output, State
from flask import g, session, request
import flask
import datetime as dt
import time
import requests
import traceback
import json
import urllib
import uuid

import sys
import os

import time
#from azureml.deploy import DeployClient
#from azureml.deploy.server import MLServer
#from azureml.common.configuration import Configuration
import pandas as pd
import sys
import re
import string
import dash
#from config import get_env
#end api_ml_calls.py imports
from flask import Flask

#initialize flask app
#app = Flask(__name__)

# Initialize the Dash app
server = Flask(__name__)
app = dash.Dash(server=server)

#app = dash.Dash(__name__, static_folder='static')
#app.title = 'Guided Resolution'
#env = 'test'
#server = app.server

#end Initialize Dash app

app.layout = html.Div(children=[
    html.H1(children='Hello Dash'),

    html.Div(children='''
        Dash: A web application framework for Python.
    '''),

    dcc.Graph(
        id='example-graph',
        figure={
            'data': [
                {'x': [1, 2, 3], 'y': [4, 1, 2], 'type': 'bar', 'name': 'SF'},
                {'x': [1, 2, 3], 'y': [2, 4, 5], 'type': 'bar', 'name': u'Montréal'},
            ],
            'layout': {
                'title': 'Dash Data Visualization'
            }
        }
    )
])



@app.server.route('/')
def hello_world():
  return 'Hello World!'

@app.server.route('/testpage')
def test():
  return 'Hello from test route!'

#original Flask
#if __name__ == '__main__':
#  app.run()

#Dash
if __name__ == '__main__':
  #app.run_server(host='127.0.0.1',port=9088,debug=True) # local
  app.run_server(host='0.0.0.0',port=80,debug=True) # locald