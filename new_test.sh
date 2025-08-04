#!/bin/bash

# Variables
JMETER_VERSION="5.6.3"
JMETER_DIR="/home/perf/apache-jmeter-${JMETER_VERSION}"
DOWNLOAD_BASE_URL="https://raw.githubusercontent.com/jeffsystem42/performance/master"

# 1. Téléchargement et installation de JMeter
cd /home/perf || exit 1
wget "https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.zip"
unzip "apache-jmeter-${JMETER_VERSION}.zip"
rm -f "apache-jmeter-${JMETER_VERSION}.zip"
chown -R perf:perf "$JMETER_DIR"
chmod -R 755 "$JMETER_DIR"

# 2. Configuration de JMeter
JMETER_PROPS="$JMETER_DIR/bin/jmeter.properties"
HC_PARAMS="$JMETER_DIR/bin/hc.parameters"
JMETER_START="$JMETER_DIR/bin/jmeter"

# Activer et ajuster les propriétés nécessaires
sed -i '/^#.*yyyy/s/^#//' "$JMETER_PROPS"
sed -i '/ignore_failed_embedded_resources/s/^#//' "$JMETER_PROPS"
sed -i 's/ignore_failed_embedded_resources=false/ignore_failed_embedded_resources=true/' "$JMETER_PROPS"
sed -i '/hc.parameters.file/s/^#//' "$JMETER_PROPS"
sed -i '/httpclient4.retrycount/s/^#//' "$JMETER_PROPS"
sed -i 's/httpclient4.retrycount=0/httpclient4.retrycount=1/' "$JMETER_PROPS"
sed -i '/httpclient4.request_sent_retry_enabled/s/^#//' "$JMETER_PROPS"
sed -i 's/httpclient4.request_sent_retry_enabled=false/httpclient4.request_sent_retry_enabled=true/' "$JMETER_PROPS"
sed -i '/httpclient4.idletimeout/s/^#//' "$JMETER_PROPS"
sed -i 's/httpclient4.idletimeout=0/httpclient4.idletimeout=60000/' "$JMETER_PROPS"

# Activer et modifier les paramètres HTTP client
sed -i '/http.connection.stalecheck/s/^#//' "$HC_PARAMS"
sed -i 's/http.connection.stalecheck=false/http.connection.stalecheck=true/' "$HC_PARAMS"

# Augmenter la mémoire JVM
sed -i 's/Xms1g/Xms5g/; s/Xmx1g/Xmx5g/' "$JMETER_START"

# 3. Téléchargement des fichiers de test et ressources
declare -A FILES_TO_DOWNLOAD=(
  ["$DOWNLOAD_BASE_URL/adresses.txt"]="/home/perf/adresses.txt"
  ["$DOWNLOAD_BASE_URL/fiches.csv"]="/home/perf/fiches.csv"
  ["$DOWNLOAD_BASE_URL/users.dat"]="$JMETER_DIR/bin/users.dat"
  ["$DOWNLOAD_BASE_URL/taille-1.pdf"]="$JMETER_DIR/bin/taille-1.pdf"
  ["$DOWNLOAD_BASE_URL/taille-2.pdf"]="$JMETER_DIR/bin/taille-2.pdf"
  ["$DOWNLOAD_BASE_URL/taille-3.pdf"]="$JMETER_DIR/bin/taille-3.pdf"
  ["$DOWNLOAD_BASE_URL/taille-4.pdf"]="$JMETER_DIR/bin/taille-4.pdf"
  ["$DOWNLOAD_BASE_URL/taille-5.pdf"]="$JMETER_DIR/bin/taille-5.pdf"
  ["$DOWNLOAD_BASE_URL/taille-1.jpg"]="$JMETER_DIR/bin/taille-1.jpg"
  ["$DOWNLOAD_BASE_URL/taille-2.jpg"]="$JMETER_DIR/bin/taille-2.jpg"
  ["$DOWNLOAD_BASE_URL/taille-3.jpg"]="$JMETER_DIR/bin/taille-3.jpg"
  ["$DOWNLOAD_BASE_URL/taille-4.jpg"]="$JMETER_DIR/bin/taille-4.jpg"
  ["$DOWNLOAD_BASE_URL/taille-5.jpg"]="$JMETER_DIR/bin/taille-5.jpg"
  ["$DOWNLOAD_BASE_URL/ext.zip"]="$JMETER_DIR/lib/ext/ext.zip"
  ["$DOWNLOAD_BASE_URL/jmeter-wssecurity-1.9.jar"]="$JMETER_DIR/lib/ext/jmeter-wssecurity-1.9.jar"
  ["$DOWNLOAD_BASE_URL/wss4j-ws-security-common-3.0.0.jar"]="$JMETER_DIR/lib/wss4j-ws-security-common-3.0.0.jar"
  ["$DOWNLOAD_BASE_URL/wss4j-ws-security-dom-3.0.0.jar"]="$JMETER_DIR/lib/wss4j-ws-security-dom-3.0.0.jar"
  ["$DOWNLOAD_BASE_URL/cmdrunner-2.3.jar"]="$JMETER_DIR/lib/cmdrunner-2.3.jar"
  ["$DOWNLOAD_BASE_URL/json-lib-2.4-jdk15.jar"]="$JMETER_DIR/lib/json-lib-2.4-jdk15.jar"
  ["$DOWNLOAD_BASE_URL/xmlsec-3.0.1.jar"]="$JMETER_DIR/lib/xmlsec-3.0.1.jar"
)

echo "Téléchargement des ressources..."
for URL in "${!FILES_TO_DOWNLOAD[@]}"; do
  DEST=${FILES_TO_DOWNLOAD[$URL]}
  wget -q -O "$DEST" "$URL" || echo "Échec du téléchargement : $URL"
done

# Droits finaux
chown -R perf:perf /home/perf
chmod -R 755 /home/perf

echo "✅ Installation et configuration de JMeter ${JMETER_VERSION} terminée avec succès."
