wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.6.3.zip
mv apache-jmeter* /home/perf
cd /home/perf
unzip apache-jmeter-5.6.3.zip
rm -rf apache-jmeter-5.6.3.zip
sed -i '/yyyy/s/^#//g' /home/perf/apache-jmeter-5.6.3/bin/jmeter.properties
sed -i '/ignore_failed_embedded_resources/s/^#//g' /home/perf/apache-jmeter-5.6.3/bin/jmeter.properties
sed -i '/ignore_failed_embedded_resources/s/false/true/' /home/perf/apache-jmeter-5.6.3/bin/jmeter.properties
#sed -i '/httpclient.socket.http/s/^#//g' /home/perf/apache-jmeter-5.6.3/bin/jmeter.properties
#sed -i '/httpclient.socket.http/s/0/128000/' /home/perf/apache-jmeter-5.6.3/bin/jmeter.properties
#sed -i '/httpclient.socket.http/s/128000/1024000/' /home/perf/apache-jmeter-5.6.3/bin/jmeter.properties
sed -i '/hc.parameters.file/s/^#//g' /home/perf/apache-jmeter-5.6.3/bin/jmeter.properties
sed -i '/http.connection.stalecheck/s/^#//g' /home/perf/apache-jmeter-5.6.3/bin/hc.parameters
sed -i '/http.connection.stalecheck/s/false/true/g' /home/perf/apache-jmeter-5.6.3/bin/hc.parameters
sed -i '/HEAP/s/1g/5g/g' /home/perf/apache-jmeter-5.6.3/bin/jmeter
sed -i '/httpclient4.retrycount/s/^#//g' /home/perf/apache-jmeter-5.6.3/bin/jmeter.properties
sed -i '/httpclient4.retrycount/s/0/1/g' /home/perf/apache-jmeter-5.6.3/bin/jmeter.properties
sed -i '/httpclient4.request_sent_retry_enabled/s/^#//g' /home/perf/apache-jmeter-5.6.3/bin/jmeter.properties
sed -i '/httpclient4.request_sent_retry_enabled/s/false/true/g' /home/perf/apache-jmeter-5.6.3/bin/jmeter.properties
sed -i '/httpclient4.idletimeout/s/^#//g' /home/perf/apache-jmeter-5.6.3/bin/jmeter.properties
sed -i '/httpclient4.idletimeout/s/0/60000/g' /home/perf/apache-jmeter-5.6.3/bin/jmeter.properties
chown -R perf:perf /home/perf
chmod -R 755 /home/perf
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/adresses.txt > /home/perf/adresses.txt
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-1.pdf > /home/perf/apache-jmeter-5.6.3/bin/taille-1.pdf
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-2.pdf > /home/perf/apache-jmeter-5.6.3/bin/taille-2.pdf
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-3.pdf > /home/perf/apache-jmeter-5.6.3/bin/taille-3.pdf
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-4.pdf > /home/perf/apache-jmeter-5.6.3/bin/taille-4.pdf
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-5.pdf > /home/perf/apache-jmeter-5.6.3/bin/taille-5.pdf
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-1.jpg > /home/perf/apache-jmeter-5.6.3/bin/taille-1.jpg
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-2.jpg > /home/perf/apache-jmeter-5.6.3/bin/taille-2.jpg
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-3.jpg > /home/perf/apache-jmeter-5.6.3/bin/taille-3.jpg
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-4.jpg > /home/perf/apache-jmeter-5.6.3/bin/taille-4.jpg
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/taille-5.jpg > /home/perf/apache-jmeter-5.6.3/bin/taille-5.jpg
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/users.dat > /home/perf/apache-jmeter-5.6.3/bin/users.dat
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/fiches.csv > /home/perf/fiches.csv
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/ext.zip > /home/perf/apache-jmeter-5.6.3/lib/ext/ext.zip
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/jmeter-wssecurity-1.9.jar > /home/perf/apache-jmeter-5.6.3/lib/ext/jmeter-wssecurity-1.9.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/wss4j-ws-security-common-3.0.0.jar > /home/perf/apache-jmeter-5.6.3/lib/wss4j-ws-security-common-3.0.0.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/wss4j-ws-security-dom-3.0.0.jar > /home/perf/apache-jmeter-5.6.3/lib/wss4j-ws-security-dom-3.0.0.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/cmdrunner-2.3.jar > /home/perf/apache-jmeter-5.6.3/lib/cmdrunner-2.3.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/json-lib-2.4-jdk15.jar > /home/perf/apache-jmeter-5.6.3/lib/json-lib-2.4-jdk15.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/xmlsec-3.0.1.jar > /home/perf/apache-jmeter-5.6.3/lib/xmlsec-3.0.1.jar

wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/http2-client-11.0.15.jar > /home/perf/apache-jmeter-5.6.3/lib/http2-client-11.0.15.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/http2-common-11.0.15.jar > /home/perf/apache-jmeter-5.6.3/lib/http2-common-11.0.15.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/http2-hpack-11.0.15.jar > /home/perf/apache-jmeter-5.6.3/lib/http2-hpack-11.0.15.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/http2-http-client-transport-11.0.15.jar > /home/perf/apache-jmeter-5.6.3/lib/http2-http-client-transport-11.0.15.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/jetty-alpn-client-11.0.15.jar > /home/perf/apache-jmeter-5.6.3/lib/jetty-alpn-client-11.0.15.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/jetty-alpn-java-client-11.0.15.jar > /home/perf/apache-jmeter-5.6.3/lib/jetty-alpn-java-client-11.0.15.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/jetty-client-11.0.15.jar > /home/perf/apache-jmeter-5.6.3/lib/jetty-client-11.0.15.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/jetty-http-11.0.15.jar > /home/perf/apache-jmeter-5.6.3/lib/jetty-http-11.0.15.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/jetty-io-11.0.15.jar > /home/perf/apache-jmeter-5.6.3/lib/jetty-io-11.0.15.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/jetty-util-11.0.15.jar > /home/perf/apache-jmeter-5.6.3/lib/jetty-util-11.0.15.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/jmeter-bzm-commons-0.2.3.jar > /home/perf/apache-jmeter-5.6.3/lib/jmeter-bzm-commons-0.2.3.jar
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/jmeter-bzm-http2-2.0.6.jar > /home/perf/apache-jmeter-5.6.3/lib/ext/jmeter-bzm-http2-2.0.6.jar

chown -R perf:perf /home/perf
chmod -R 755 /home/perf
