sudo apt update
sudo apt install --assume-yes ansible openjdk-8-jdk unzip
wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.3.zip
mv apache-jmeter* /home/gto
cd /home/gto
unzip apache-jmeter-3.3.zip
