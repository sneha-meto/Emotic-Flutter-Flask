from flask import Flask, jsonify, request
import emotion_analysis as emo
import sentiment_analysis as senti

app = Flask(__name__)
@app.route('/',methods=['GET'])
def index():
    json_file = {}
    json_file['query'] = 'hello_world'
    return jsonify(json_file)

@app.route('/post', methods=["POST"])
def testpost():
     input_json = request.get_json(force=True)
     dictToReturn = {'text':input_json['text']}
     return jsonify(dictToReturn)

@app.route('/emo/text', methods=["POST"])
def classify_emo():
     input_json = request.get_json(force=True)
     response = {'sentiment':emo.predict_emotion(input_json['text'])}
     return jsonify(response)

@app.route('/senti/text', methods=["POST"])
def classify_senti():
     input_json = request.get_json(force=True)
     data = senti.get_text_sentiment(input_json['text'])
     response = {'sentiment':data[0],'subjectivity':data[1]}
     return jsonify(response)

# @app.after_request
# def add_headers(resp):
#     resp.headers['Access-Control-Allow-Origin'] = '*'
#     resp.headers['Access-Control-Allow-Headers'] = 'Content-Type'
#     resp.headers['Referrer-Policy'] = 'no-referrer-when-downgrade'
#     return resp

if __name__ == '__main__':
    app.run(debug=True)