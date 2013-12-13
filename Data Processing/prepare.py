from pymongo import MongoClient
client=MongoClient('mongodb://10.39.1.41:27017/')
db=client.streamDb
tweets=db.Processed
of=open('processed.txt','w')

for tweet in tweets.find( {} , { 'timestamp': 1,'drug': 1, 'side_effect': 1, 'sentiment': 1, 'time_zone': 1 , 'utc_offset': 1 }):
    try: 
        utc_offset = tweet['utc_offset']
    except KeyError:
        utc_offset = ""
    try:
        time_zone = tweet['time_zone']
    except KeyError:
        time_zone = ""
    try:
        timestamp = tweet['timestamp']
    except KeyError:
        timestamp = ""
    try:
        sent = tweet['sentiment']
    except KeyError:
        sent = ""
    try:
        side_effect = tweet['side_effect']
    except:
        side_effect = 'others'
    drug=str(tweet['drug'])
    output = drug + "|" + str(timestamp) + "|" +str(side_effect)+ "|"+str(sent)+ "|"+ str(time_zone)+"|"+ str(utc_offset) +"\n"
    of.write(output)
of.close()
     
