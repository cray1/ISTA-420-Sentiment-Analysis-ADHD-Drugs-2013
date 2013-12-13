from pymongo import MongoClient
import sys
client=MongoClient('mongodb://10.39.1.41:27017/')
db=client.streamDb
tweets=db.AdderallCollection
of=open('Adderall.txt','w')
for tweet in tweets.find():
    output = str(tweet)
    of.write(output)
of.close()
tweets=db.VyvanseCollection
of=open('Vyvanse.txt','w')
for tweet in tweets.find():
    output = str(tweet)
    of.write(output)
of.close()
tweets=db.RitalinCollection
of=open('Ritalin.txt','w')
for tweet in tweets.find():
    output = str(tweet)
    of.write(output)
of.close()
