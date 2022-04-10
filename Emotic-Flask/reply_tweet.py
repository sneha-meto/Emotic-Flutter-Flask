import tweepy
import configparser
import nltk
nltk.download('punkt')
nltk.download('wordnet')

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

def gather_tweet_and_reply():


        reply_list = []
        id_list=["1512667895419273218"]
        tweets = api.get_status("1512667895419273218")
        print(tweets.user.screen_name)
        user_name=tweets.user.screen_name


        replies = tweepy.Cursor(api.search_tweets, q =  " to:" + str(user_name),
                include_entities = True,
                tweet_mode = 'extended',
                lang = 'en').items(10)


        print("in reply")
        for reply in replies:
                if reply.in_reply_to_status_id_str in id_list:
                        print(reply.in_reply_to_status_id)
                        reply_list.append([reply.in_reply_to_status_id_str, reply.user.screen_name,reply.full_text.replace('\n','')])
                        print([reply.in_reply_to_status_id,reply.user.screen_name,reply.full_text.replace('\n','')])

gather_tweet_and_reply()
