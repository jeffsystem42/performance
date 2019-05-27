wget http://apache.crihan.fr/dist//jmeter/binaries/apache-jmeter-5.1.1.zip
mv apache-jmeter* /home/perf
cd /home/perf
unzip apache-jmeter-5.1.1.zip
rm -rf apache-jmeter-5.1.1.zip
sed -i '/yyyy/s/^#//g' /home/perf/apache-jmeter-5.1.1/bin/jmeter.properties
sed -i '/HEAP/s/1g/2g/g' /home/perf/apache-jmeter-5.1.1/bin/jmeter
chown -R perf:perf /home/perf
chmod -R 755 /home/perf
#wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/vote1.jmx > vote1.jmx
