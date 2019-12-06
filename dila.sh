wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.1.1.zip
mv apache-jmeter* /home/outscale
cd /home/outscale
unzip apache-jmeter-5.1.1.zip
rm -rf apache-jmeter-5.1.1.zip
chown -R outscale:outscale /home/outscale
chmod -R 755 /home/outscale
