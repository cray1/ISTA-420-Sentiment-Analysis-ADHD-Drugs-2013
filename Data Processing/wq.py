#!/usr/bin/python
from work_queue import *
import sys
try:
    Q = WorkQueue(port = 20994)
    Q.specify_name("ACIC2013")
except:
    print "could not instantiate Work Queue master"
    sys.exit(1)
path=os.getcwd() 
print "Listening on port %d." % Q.port
tweet_files=os.listdir(path+"/data")

print "Open a new terminal window to submit workers."
print "Please add cctools directory to your path in the new terminal."
print "submit workers to this queue with -> torque_submit_workers -t 300 servername 20994 100."
for tweetfile in tweet_files:
    infile1 = path+"/data/"+tweetfile
    command = "python datahandling.py %s" % tweetfile 
    print command
    T = Task(command)
 
    T.specify_file("datahandling.py", "datahandling.py", WORK_QUEUE_INPUT, cache = True)
    T.specify_file(infile1, infile1, WORK_QUEUE_INPUT, cache = True)
    
    #T.specify_file(infile2, infile2, WORK_QUEUE_INPUT, cache = True)
    #T.specify_file(outfile, outfile, WORK_QUEUE_OUTPUT, cache = False)
 
    taskid = Q.submit(T)
    
print "done."
 
print "Waiting for tasks to complete..."
while not Q.empty():
    T = Q.wait(5)
    if T:
        print "task (id# %d): %s (return result %s)" % (T.id, T.command, T.result)
        print T.output
print "done."
