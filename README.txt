To run the word count example:

1. Build the docker image:
  % docker build -t hadoop .

2. Start the docker container:
  % docker run -d -P --name hadoop hadoop

3. Find the ssh and Web UI port:
  % docker port hadoop

4. Login to the container (password is 'hadoop')
  % ssh -p $sshport -l hadoop 0.0.0.0
  
5. Start the Hadoop servers:
  % ./start-all.sh

6. Create the input directory:
  % nutch ndfs -mkdir wc-input
  % nutch ndfs -put alice.txt wc-input/

7. Look at the NDFS:
  % nutch ndfs -ls
  
8. Submit the mapreduce job:
  % nutch job -submit wordcount.xml

9. Look at the JobTracker Web UI:
  go to http://0.0.0.0:$webport/ in browser
  
10. Look at the output:
  % nutch ndfs -get wc-output .
  % less wc-output/port-00000
