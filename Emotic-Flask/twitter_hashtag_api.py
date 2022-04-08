import tweepy
import configparser
import nltk
nltk.download('punkt')
nltk.download('wordnet')
import re
import itertools
import numpy as np
from nltk.stem.wordnet import WordNetLemmatizer


config = configparser.ConfigParser()
config.read('config.ini')
api_key = config['twitter']['api_key']
api_key_secret = config['twitter']['api_key_secret']

access_token = config['twitter']['access_token']
access_token_secret = config['twitter']['access_token_secret']

# authentication

auth = tweepy.OAuthHandler(api_key, api_key_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)
print("Enter Twitter HashTag to search for")
words = input()

lem = WordNetLemmatizer()
def cleaning(text):
    txt = str(text)
    txt = re.sub(r"http\S+", "", txt)
    if len(txt) == 0:
        return 'no text'
    else:
        txt = txt.split()
        index = 0
        for j in range(len(txt)):
            if txt[j][0] == '@':
                index = j
        txt = np.delete(txt, index)
        if len(txt) == 0:
            return 'no text'
        else:
            words = txt[0]
            for k in range(len(txt) - 1):
                words += " " + txt[k + 1]
            txt = words
            txt = re.sub(r'[^\w]', ' ', txt)
            if len(txt) == 0:
                return 'no text'
            else:
                txt = ''.join(''.join(s)[:2] for _, s in itertools.groupby(txt))
                txt = txt.replace("'", "")
                txt = nltk.tokenize.word_tokenize(txt)
                # data.content[i] = [w for w in data.content[i] if not w in stopset]
                for j in range(len(txt)):
                    txt[j] = lem.lemmatize(txt[j], "v")
                if len(txt) == 0:
                    return 'no text'
                else:
                    return txt

def printtweetdata(n, ith_tweet):
    print()
    print(f"Tweet {n}:")
    print(f"Username:{ith_tweet[0]}")
    print(f"Description:{ith_tweet[1]}")
    print(f"Location:{ith_tweet[2]}")
    print(f"Following Count:{ith_tweet[3]}")
    print(f"Follower Count:{ith_tweet[4]}")
    print(f"Total Tweets:{ith_tweet[5]}")
    print(f"Retweet Count:{ith_tweet[6]}")
    print(f"Tweet Text:{ith_tweet[7]}")
    print(f"cleaned Text:{ith_tweet[8]}")
    print(f"Hashtags Used:{ith_tweet[9]}")
    print(f"likes:{ith_tweet[10]}")
    print(f"tweet id:{ith_tweet[11]}")
    print(f"tweet time:{ith_tweet[12]}")
def scrape(words, numtweet):
    tweets = tweepy.Cursor(api.search_tweets,
                           words, lang="en",
                           result_type='popular',
                           tweet_mode='extended').items(numtweet)
    list_tweets = [tweet for tweet in tweets]

    i = 1
    for tweet in list_tweets:

        username = tweet.user.screen_name
        description = tweet.user.description
        location = tweet.user.location
        following = tweet.user.friends_count
        followers = tweet.user.followers_count
        totaltweets = tweet.user.statuses_count
        retweetcount = tweet.retweet_count
        hashtags = tweet.entities['hashtags']
        tweetlikes = tweet.favorite_count
        tweetid = tweet.id
        tweettime=tweet.created_at
        try:
            text = tweet.retweeted_status.full_text
        except AttributeError:
            text = tweet.full_text
        hashtext = list()
        for j in range(0, len(hashtags)):
            hashtext.append(hashtags[j]['text'])
        txt = cleaning(text)
        ith_tweet = [username, description, location, following, followers, totaltweets,
                     retweetcount, text, txt, hashtext, tweetlikes, tweetid, tweettime]

        printtweetdata(i, ith_tweet)
        i = i + 1


numtweet = 20
scrape(words, numtweet)
print('Scraping has completed!')