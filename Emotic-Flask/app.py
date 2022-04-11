from flask import Flask, jsonify, request
import emotion_analysis as emo
import sentiment_analysis as senti
import twitter_fetch as tf
import response_helper as helper
import configparser

app = Flask(__name__)
# @app.route('/',methods=['GET'])
# def index():
#     json_file = {}
#     json_file['query'] = 'hello_world'
#     return jsonify(json_file)


@app.route('/emo/text', methods=["POST"])
def classify_emo_text():
     input_json = request.get_json(force=True)
     response = {'sentiment':emo.predict_emotion(input_json['text'])}
     return jsonify(response),200


@app.route('/emo/tag', methods=["POST"])
def classify_emo_tag():
     input_json = request.get_json(force=True)
     obj = tf.TwitterFetch()
     cleaned_tweets = obj.scrape(True, input_json['hashtag'])
     response = helper.get_emo_response(cleaned_tweets)
     return jsonify(response),200


@app.route('/emo/user', methods=["POST"])
def classify_emo_user():
     input_json = request.get_json(force=True)
     obj = tf.TwitterFetch()
     cleaned_tweets = obj.scrape(False, input_json['username'])
     response = helper.get_emo_response(cleaned_tweets)
     return jsonify(response),200


@app.route('/senti/text', methods=["POST"])
def classify_senti_text():
     input_json = request.get_json(force=True)
     data = senti.get_text_sentiment(input_json['text'])
     response = {'sentiment':data[0],'subjectivity':data[1]}
     return jsonify(response),200


@app.route('/senti/tag', methods=["POST"])
def classify_senti_tag():
     input_json = request.get_json(force=True)
     obj = tf.TwitterFetch()
     cleaned_tweets = obj.scrape(True, input_json['hashtag'])
     response = helper.get_senti_response(cleaned_tweets)
     return jsonify(response),200


@app.route('/senti/user', methods=["POST"])
def classify_senti_user():
     input_json = request.get_json(force=True)
     obj = tf.TwitterFetch()
     cleaned_tweets = obj.scrape(False,input_json['username'])
     response = helper.get_senti_response(cleaned_tweets)
     return jsonify(response),200

@app.before_request
def authenticate_api():
     config = configparser.ConfigParser()
     config.read('auth.ini')
     api_key = config['api']['key']

     headers = request.headers
     auth = headers.get("X-Api-Key")
     if auth != api_key:
          return jsonify({"message": "ERROR: Unauthorized"}), 401

# @app.after_request
# def add_headers(resp):
#     resp.headers['Access-Control-Allow-Origin'] = '*'
#     resp.headers['Access-Control-Allow-Headers'] = 'Content-Type'
#     resp.headers['Referrer-Policy'] = 'no-referrer-when-downgrade'
#     return resp

if __name__ == '__main__':
    app.run(debug=True)