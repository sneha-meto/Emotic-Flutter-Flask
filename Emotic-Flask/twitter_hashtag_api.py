import tweepy
import configparser


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


def printtweetdata(n, ith_tweet):
    print()
    print(f"Tweet {n}:")
    print(f"Username:{ith_tweet[0]}")
    print(f"Retweet Count:{ith_tweet[1]}")
    print(f"Tweet Text:{ith_tweet[2]}")
    print(f"Hashtags Used:{ith_tweet[3]}")
    print(f"likes:{ith_tweet[4]}")
    print(f"tweet id:{ith_tweet[4]}")
    print(f"tweet time:{ith_tweet[5]}")
def scrape(words, numtweet):
    tweets = tweepy.Cursor(api.search_tweets,
                           words, lang="en",
                           result_type='popular',
                           tweet_mode='extended').items(numtweet)
    list_tweets = [tweet for tweet in tweets]

    i = 1
    for tweet in list_tweets:

        username = tweet.user.screen_name
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
        ith_tweet = [username,
                     retweetcount, text, hashtext, tweetlikes,tweetid,tweettime]

        printtweetdata(i, ith_tweet)
        i = i + 1


numtweet = 20
scrape(words, numtweet)
print('Scraping has completed!')