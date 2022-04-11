import pickle


def predict_emotion(tweet):

        # load vectorizer
        vectorizer = pickle.load(open("vectorizer.sav", 'rb'))

        # load trained model
        model = pickle.load(open("classifier.sav", 'rb'))

        test = vectorizer.transform([tweet])
        predicted_sentiment = model.predict(test)
        final_sentiment = (predicted_sentiment[0])
        final_sentiment = str(final_sentiment)
        if final_sentiment == '0':
            return 'sadness'
        elif final_sentiment == '1':
            return 'joy'
        elif final_sentiment == '2':
            return 'love'
        elif final_sentiment == '3':
            return 'anger'
        elif final_sentiment == '4':
            return 'fear'
        elif final_sentiment == '5':
            return 'surprise'

