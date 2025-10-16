from flask import Flask, jsonify
import socket
import datetime
import boto3

app = Flask(__name__)

@app.route('/')
def home():
    return "Flask App is Running!"

@app.route('/info')
def info():
    # Get instance metadata if on AWS, else fallback
    try:
        ec2 = boto3.client('ec2', region_name='us-east-1')
        instance_id = socket.gethostname()
        availability_zone = 'us-east-1a'
    except Exception:
        instance_id = 'local'
        availability_zone = 'local'

    timestamp = datetime.datetime.utcnow().isoformat()
    return jsonify({
        'instance_id': instance_id,
        'availability_zone': availability_zone,
        'timestamp': timestamp
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
