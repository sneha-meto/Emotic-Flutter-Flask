from textblob import TextBlob


def get_text_sentiment(tweet):
    analysis = TextBlob(tweet)
    sub = analysis.sentiment.subjectivity
    if analysis.sentiment.polarity > 0:
        return 'positive', sub
    elif analysis.sentiment.polarity == 0:
        return 'neutral', sub
    else:
        return 'negative', sub

# twt=input("tweet: ")
# print(get_tweet_sentiment(twt))