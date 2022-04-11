import tweepy
import configparser
import nltk
# nltk.download('punkt')
# nltk.download('wordnet')
import re
import itertools
import numpy as np
from nltk.stem.wordnet import WordNetLemmatizer


class TwitterFetch:
    lem = WordNetLemmatizer()
    cleaned_tweets=[]

    def authenticate(self):
        config = configparser.ConfigParser()
        config.read('config.ini')
        api_key = config['twitter']['api_key']
        api_key_secret = config['twitter']['api_key_secret']
        access_token = config['twitter']['access_token']
        access_token_secret = config['twitter']['access_token_secret']

        auth = tweepy.OAuthHandler(api_key, api_key_secret)
        auth.set_access_token(access_token, access_token_secret)

        api = tweepy.API(auth)
        return api

    def cleaning(self, text):
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
                        txt[j] = self.lem.lemmatize(txt[j], "v")
                    if len(txt) == 0:
                        return 'no text'
                    else:
                        return txt

    def printtweetdata(self, n, ith_tweet):
        print()
        print(f"Tweet {n}:")
        print(f"cleaned Text:{ith_tweet[0]}")
        print(f"Tweet Text:{ith_tweet[1]}")
        print(f"Username:{ith_tweet[2]}")
        print(f"Screen Name:{ith_tweet[3]}")
        print(f"Location:{ith_tweet[4]}")
        print(f"User pic:{ith_tweet[5]}")
        print(f"Retweet Count:{ith_tweet[6]}")
        print(f"Hashtags Used:{ith_tweet[7]}")
        print(f"likes:{ith_tweet[8]}")
        print(f"tweet id:{ith_tweet[9]}")
        print(f"tweet time:{ith_tweet[10]}")

    def scrape(self, istag, input):
        numtweet = 50
        api = self.authenticate()

        if istag:
        # case tag
            tweets = tweepy.Cursor(api.search_tweets,
                                   input, lang="en",
                                   result_type='popular',
                                   tweet_mode='extended').items(numtweet)
            list_tweets = [tweet for tweet in tweets]
        else:
        # case user

            tweets = tweepy.Cursor(api.search_tweets,
                                   input, lang="en",
                                   result_type='mixed',
                                   tweet_mode='extended').items(numtweet)
            list_tweets = [tweet for tweet in tweets]

        i = 1
        for tweet in list_tweets:
            tweetid = tweet.id
            username = tweet.user.name
            screenname = tweet.user.screen_name
            location = tweet.user.location
            retweetcount = tweet.retweet_count
            tweetlikes = tweet.favorite_count
            hashtags = tweet.entities['hashtags']
            tweettime = tweet.created_at
            userpic = tweet.user.profile_image_url
            try:
                text = tweet.retweeted_status.full_text
            except AttributeError:
                text = tweet.full_text
            hashtext = list()
            for j in range(0, len(hashtags)):
                hashtext.append(hashtags[j]['text'])
            txt = self.cleaning(text)
            cleantxt=' '.join(txt)
            ith_tweet = [cleantxt, text,  username, screenname, location,  userpic,
                         retweetcount, hashtext, tweetlikes, tweetid, tweettime]

            self.cleaned_tweets.append(ith_tweet)
            # self.printtweetdata(i, ith_tweet)

            i = i + 1
        return self.cleaned_tweets


if __name__ == '__main__':
    tag = input("Enter Twitter HashTag to search for: ")
    obj = TwitterFetch()
    obj.scrape(True,tag)
    print('Scraping has completed!')