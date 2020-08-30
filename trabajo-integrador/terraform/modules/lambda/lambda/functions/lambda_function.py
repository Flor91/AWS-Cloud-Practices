import boto3
import json
import datetime

s3_client = boto3.client('s3')


def lambda_handler(event, context):
  print("Received event: " + json.dumps(event))

  bucket = 'aiouti-lf'
  date = str(round(datetime.datetime.strptime(event['date'],
                                              '%Y-%m-%dT%H:%M:%S.%fZ').timestamp()))
  key = date + '.json'

  with open('/tmp/' + key, "w+") as write_file:
    json.dump(event, write_file)

  s3_client.upload_file('/tmp/' + key, bucket,
                        'lakeformation/measurements/raw/' + key)
