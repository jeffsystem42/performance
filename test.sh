wget http://apache.crihan.fr/dist//jmeter/binaries/apache-jmeter-5.1.1.zip
mv apache-jmeter* /home/perf
cd /home/perf
unzip apache-jmeter-5.1.1.zip
rm -rf apache-jmeter-5.1.1.zip
sed -i '/yyyy/s/^#//g' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
sed -i '/ignore_failed_embedded_resources/s/^#//g' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
sed -i '/ignore_failed_embedded_resources/s/false/true/' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
sed -i '/httpclient.socket.http/s/^#//g' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
sed -i '/httpclient.socket.http/s/0/128000/' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
#sed -i '/httpclient.socket.http/s/128000/1024000/' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
sed -i '/hc.parameters.file/s/^#//g' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
sed -i '/http.connection.stalecheck/s/^#//g' /home/perf/apache-jmeter-5.1.1/bin/hc.parameters
sed -i '/http.connection.stalecheck/s/false/true/g' /home/perf/apache-jmeter-5.1.1/bin/hc.parameters
sed -i '/HEAP/s/1g/5g/g' /home/perf/apache-jmeter-5.1.1/bin/jmeter
sed -i '/httpclient4.retrycount/s/^#//g' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
sed -i '/httpclient4.retrycount/s/0/1/g' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
sed -i '/httpclient4.request_sent_retry_enabled/s/^#//g' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
sed -i '/httpclient4.request_sent_retry_enabled/s/false/true/g' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
sed -i '/httpclient4.idletimeout/s/^#//g' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
sed -i '/httpclient4.idletimeout/s/0/60000/g' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
chown -R perf:perf /home/perf
chmod -R 755 /home/perf
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/adresses.txt > /home/perf/adresses.txt
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-1.pdf > /home/perf/apache-jmeter-5.1.1/bin/taille-1.pdf
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-2.pdf > /home/perf/apache-jmeter-5.1.1/bin/taille-2.pdf
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-3.pdf > /home/perf/apache-jmeter-5.1.1/bin/taille-3.pdf
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-4.pdf > /home/perf/apache-jmeter-5.1.1/bin/taille-4.pdf
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-5.pdf > /home/perf/apache-jmeter-5.1.1/bin/taille-5.pdf
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-1.jpg > /home/perf/apache-jmeter-5.1.1/bin/taille-1.jpg
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-2.jpg > /home/perf/apache-jmeter-5.1.1/bin/taille-2.jpg
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-3.jpg > /home/perf/apache-jmeter-5.1.1/bin/taille-3.jpg
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-4.jpg > /home/perf/apache-jmeter-5.1.1/bin/taille-4.jpg
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-5.jpg > /home/perf/apache-jmeter-5.1.1/bin/taille-5.jpg
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/users.dat > /home/perf/apache-jmeter-5.1.1/bin/users.dat
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/fiches.csv > /home/perf/fiches.csv
