#!/usr/bin/perl 

use work_queue;

my $q = work_queue_create(20994);
if (not defined($q)) {
   print "could not instantiate Work Queue master\n";
   exit 1;
}

$port = work_queue_port($q);
print "Listening on port $port.\n"; 

for (my $i = 0; $i < 100; $i++) {
   my $infile = "input.txt";
   
   my $command = "python simulation.py $infile ";

   my $t = work_queue_task_create($command);

   work_queue_task_specify_file($t,"datahandling.py","datahandling.py",$WORK_QUEUE_INPUT,$WORK_QUEUE_CACHE);
   work_queue_task_specify_file($t,$infile,$infile,$WORK_QUEUE_INPUT,$WORK_QUEUE_CACHE);
   

   my $taskid = work_queue_submit($q, $t);
}
print "done." 

print "Waiting for tasks to complete...\n";
while (not work_queue_empty($q)) {
    my $t = work_queue_wait($q, 5);

    if (defined($t)) {
      print "task (id#$t->{taskid}) complete:$t->{command_line} (return code $t->{return_status})\n";
    work_queue_task_delete($t);
    }
}

print "done.\n";

work_queue_delete($q);

exit 0;
