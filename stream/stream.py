from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream
from pymongo import MongoClient
from time import gmtime, strftime 
import json
import sys

#output ='Adderall.txt'


if(sys.argv[1] == 'Vyvanse'):
	access_token = '411002372-MOiivsGVp7iP45LVEzCGOR9glVtlHlB8mq31fCjf'
	access_token_secret = 'oGRBznxqXQr51YEPo2X95jAObO2pFKYR1UDYFHRiBs7Qq'
	consumer_key = 'rDvtr50WImCcrj1xniKyLw'
	consumer_secret = 'GMIpRHFjncuvY5PBIX12oM5fTxqHs9lNu3QlZJbQK4'
	filterString = "Vyvanse"
elif(sys.argv[1] == 'Ritalin'):
	access_token ='411002372-f9FuykskBRCUt22Tn6zNQwAkyrhBJJp82XCrKmrX'
	access_token_secret='tMrw7CPDLTrBfM2L5y6WDmVUnxnm12QWmVZ77ykmYROOB'
	consumer_key='2amZ3VwgaxUxzWxNgXxZzg'
	consumer_secret='5g4lmRbwLSqx4cSeTYoc536wYu6nhX9NJ7Rns1Ots'
	filterString = "Ritalin"
else: #default to Adderall tokiens
	consumer_key="7iyqm4MlPkyqLAUlIqUw"
	consumer_secret="e06K5JyVF3GbkVdJyTjdD0TxeXH4pluDwsYaUEA7e0" 
	access_token="411002372-oRBxHLZzaJO1BMjkQWTW7WY9K0Td4uMChUmtJiQM"
	access_token_secret="n8Ud9E0F35bY7Ww79TkZMdiv80Yin6KQcMIoWLwkQhpXX"
	filterString="Adderall"

class StdOutListener(StreamListener):
	""" A listener handles tweets are the received from the stream.
	This is a basic listener that just prints received tweets to stdout.
	"""
	def on_data(self, data):
		#print data
		#of=open(output, 'a')
		#of.write(str(data))
		#of.close()
		
		client=MongoClient('mongodb://10.39.1.41:27017/')
		db = client.streamDb 
		if(sys.argv[1] == 'Vyvanse'):
			collection =  db.RitalinCollection
		elif(sys.argv[1] == 'Ritalin'):
			collection =  db.VyvanseCollection
		else:
			collection =   db.AdderallCollection
		tweet = json.loads(data)
		try:
			isRetweet = tweet['retweeted_status'] # this only exists if the tweet is a retweet
			isRetweet = "true"
		except KeyError:
			isRetweet = "false"
		if(isRetweet == "false"):
			try:
				text = tweet['text']
				text = text.decode("ascii", "ignore")
			except KeyError:
				text = ""
			except UnicodeEncodeError:
				text = ""
			try:
				messageId = tweet['id_str']
			except KeyError:
				messageId = ""
			try:
				userId = tweet['user']['id_str']
			except KeyError:
				userId = ""
			try:
				utc_offset = tweet['user']['utc_offset']
			except KeyError:
				utc_offset = ""
			try:
				time_zone = tweet['user']['time_zone']
			except KeyError:
				time_zone = ""
			try:
				lang = tweet['lang']
			except KeyError:
				lang = "" 
			messageArray = {"text" : text,"messageId" : messageId,"userId" : userId,"utc_offset" : utc_offset, "time_zone" : time_zone,"lang" : lang, "timestamp" : strftime("%Y-%m-%d %H:%M:%S", gmtime())}
			if(len(text)>0): 
				post_id = collection.insert(messageArray) 
				print("Inserting: %s" %(post_id))
				print messageArray
		return True
	def on_error(self, status):
		print status
l = StdOutListener()
auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)
stream = Stream(auth, l)
stream.filter(track=[filterString]) 