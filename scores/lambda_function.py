import json
import boto3
from datetime import datetime

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('scores')

def create_response(status_code, body):
    return {
        'statusCode':status_code,
        'body': json.dumps(body, indent=2),
        'headers': {
            'Content-Type': 'application/json'
        }
    }
    
def get_scores():
    result = table.scan()['Items']
    result.sort(key = lambda item: item['timestamp'])
    result.sort(key = lambda item: item['score'], reverse = True)
    results = []
    for item in result:
        results.append({
            'initials': item['initials'],
            'score': int(item['score']), #convert decimal into n integer
            'timestamp': item['timestamp'],
        })
    
    return results

def parse_body(str):
    try:
        data = json.loads(str)
        if 'initials' in data and 'score' in data:
            return data
        else:
            return None
    except json.decoder.JSONDecodeError:
        return None
        
def create_new_score(event):
    data = parse_body(event.get('body', ''))
    if data:
        data['timestamp'] = datetime.now().strftime('%Y-%m-%d %H:%M:%S.%f')
        table.put_item(Item=data)
        return True
    return False
def lambda_handler(event, context):
    method = event.get('httpMethod', 'Nothing') #Avoid error in event['httpMethod']
    if method == 'GET':
        return create_response(200, get_scores())
    elif method == 'POST':
        if create_new_score(event):
            return create_response(201, {'message': 'Resource created succesfully'})
        else:
            return create_response(400, {'message': 'Resource creation failed'})
            
    else:
        return create_response(405, { 'error': f'Method "{method}" not allowed' })
