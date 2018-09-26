#begin guidedres.py imports
import dash_core_components as dcc
import dash_html_components as html
import dash_dangerously_set_inner_html
import dash
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
from azureml.deploy import DeployClient
from azureml.deploy.server import MLServer
from azureml.common.configuration import Configuration
import pandas as pd
import sys
import re
import string
#from config import get_env
#end api_ml_calls.py imports
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