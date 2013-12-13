from pymongo import MongoClient
import json
import unicodedata
import re
import os
import nltk
from senti_classifier import senti_classifier
client=MongoClient('mongodb://10.39.1.41:27017/')
db=client.streamDb
tweets=db.test1
collection=db.adderallProcessed
def map_lexicon(text):
    tokens=nltk.word_tokenize(text.lower())
    keywords={ 'diet':'Anorexia','weight':'Anorexia','loss':'Anorexia','hungry':'Anorexia','fatter':'Anorexia','rage':'Aggression','comedown':'Aggression', 'crazy':'Aggression','rude':'Aggression', 'annoyed':'Aggression', 'impatient':'Aggression' ,'pissed':'Aggression','hyper':'Aggression' ,'talkative':'Aggression' ,'abnormal':'Aggression' ,'different':'Aggression','never':'Aggression','bladder':'Incontinence','pissing':'Incontinence','shitting':'Incontinence','shit':'Incontinence','poop':'Incontinence','bathroom':'Incontinence','toilet':'Incontinence','breathing':'Dyspnoea','air':'Dyspnoea','inhaler':'Dyspnoea','thirsty':'Dyspnoea','twitch':'Dystonia','jolt':'Dystonia','jitter':'Dystonia','jittery':'Dystonia','shaky':'Dystonia','cracked':'Dystonia','still':'Dystonia','restless':'Dystonia','dancing':'Dystonia','beat':'Heart problems','heart':'Heart problems','seizure':'Convulsion','muscles':'Convulsion','tightening':'Convulsion','tight':'Convulsion','stuck':'Convulsion','shaking':'Convulsion','tooth':'Tooth Injury','teeth':'Tooth Injury','grinding':'Tooth Injury','zombie':'Fatigue','brain':'Fatigue','dead':'Fatigue','retarted':'Fatigue','stupid':'Fatigue','throw':'Nausea/Discomfort','threw':'Nausea/Discomfort','stomach':'Nausea/Discomfort', 'stomachache':'Nausea/Discomfort','nighter':'Insomnia','AM':'Insomnia','sleep':'Insomnia','sleepless':'Insomnia','tired':'Insomnia','sun':'Insomnia','morning':'Insomnia','kicking':'Insomnia','pale':'Pallor','white':'Pallor','color':'Pallor','skin':'Pallor'}
    event=' '
    for token in tokens:
        event=keywords.get(token,'others')
        if event!='others':
            return event
    return event
    
for tweet in tweets.find({"retweeted_status": None, "user.lang": "en" }):
    try:
        text = tweet['text']
        text = text.encode("ascii", "ignore")
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
    try:
        timestamp = tweet['created_at']
    except KeyError:
        timestamp = ""
    text=re.sub(r'@\w*',' ', text)  
    text=re.sub(r'htt\w*://t.co/\w*',' ',text)
    text=re.sub(r'#\w*','',text)
    sentence=text.split()
    pos_score,neg_score=senti_classifier.polarity_scores(sentence)
    print text
    sentiment='negative'
    if pos_score>neg_score:
        sentiment='positive'
    print sentiment
    print pos_score,neg_score
    event=map_lexicon(text)
    print event
    messageArray = {"text" : text,"messageId" : messageId,"userId" : userId,"utc_offset" : utc_offset, "time_zone" : time_zone,"lang" : lang, "timestamp" : timestamp, "sentiment" : sentiment, "side_effect" : event}
    if len(text)>0:
        post_id = collection.insert(messageArray)
        print("Inserting: %s" %(post_id))
        
    
