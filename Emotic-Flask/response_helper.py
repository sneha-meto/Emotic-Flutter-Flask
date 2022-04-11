import sentiment_analysis as senti
from collections import Counter
import emotion_analysis as emo


def get_related_tags(tags):
    ct = Counter(tags)
    if len(ct) >= 10:
        freq = ct.most_common(10)
    else:
        freq = ct.most_common(len(ct))
    related_tags = [tag[0] for tag in freq]
    return related_tags


def get_popular_tweets(twts):
    popularity = []
    for twt in twts:
        popularity.append([twt['tweet_id'], twt['retweets'] + twt['likes']])
    popularity.sort(key=lambda x: x[1])
    popularity = [twt[0] for twt in popularity]
    if len(popularity) >= 10:
        return popularity[:10]
    else:
        return popularity


def get_senti_response(cleaned_tweets):
    twt_responses = []
    all_sentiments = []
    all_tags=[]
    for twt in cleaned_tweets:
        data = senti.get_text_sentiment(twt[0])
        all_sentiments.append(data[0])
        # 'hashtags': twt[7]
        all_tags.extend(twt[7])
        twt_response = {'sentiment': data[0], 'subjectivity': data[1], 'text': twt[1], 'username': twt[2],
                        'screen_name': twt[3], 'location': twt[4], 'profile_pic': twt[5], 'retweets': twt[6],
                        'likes': twt[8], 'tweet_id': twt[9], 'tweet_time': twt[10]}
        twt_responses.append(twt_response)
    related_tags = get_related_tags(all_tags)
    popular_twts = get_popular_tweets(twt_responses)
    analysis = {'positive': all_sentiments.count('positive'), 'negative': all_sentiments.count('negative'),
                'neutral': all_sentiments.count('neutral')}
    response = {'count': len(cleaned_tweets), 'related_tags': related_tags, 'analysis': analysis, 'tweets': twt_responses, 'popular_tweets': popular_twts}
    return response


def get_emo_response(cleaned_tweets):
    twt_responses = []
    all_emotions = []
    all_tags=[]
    for twt in cleaned_tweets:
        emotion = emo.predict_emotion(twt[0])
        all_emotions.append(emotion)
        # 'hashtags': twt[7]
        all_tags.extend(twt[7])
        twt_response = {'emotion': emotion, 'text': twt[1], 'username': twt[2],
                        'screen_name': twt[3], 'location': twt[4], 'profile_pic': twt[5], 'retweets': twt[6],
                        'likes': twt[8], 'tweet_id': twt[9], 'tweet_time': twt[10]}
        twt_responses.append(twt_response)
    related_tags = get_related_tags(all_tags)
    popular_twts = get_popular_tweets(twt_responses)
    analysis = {'sadness': all_emotions.count('sadness'), 'joy': all_emotions.count('joy'),
                'love': all_emotions.count('love'), 'anger': all_emotions.count('anger'), 'fear': all_emotions.count('fear'), 'surprise': all_emotions.count('surprise')}
    response = {'count': len(cleaned_tweets), 'related_tags': related_tags, 'analysis': analysis, 'tweets': twt_responses, 'popular_tweets': popular_twts}
    return response

