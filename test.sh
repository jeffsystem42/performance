wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.3.zip
mv apache-jmeter* /home/gto
cd /home/gto
unzip apache-jmeter-3.3.zip
rm -rf apache-jmeter-3.3.zip
wget -q -O - https://raw.githubusercontent.com/jeffsystem42/performance/master/vote1.jmx > vote1.jmx
