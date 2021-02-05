#!/bin/bash
# Slay the Spire Finnish localization
# Check 'em and pack 'em

JQ_BIN=/usr/bin/jq
ZIP_BIN=/usr/bin/zip

DATE=`/bin/date +%Y%m%d`
ZIP_FILE="fin-$DATE.zip"
CUR_DIR=`pwd`

if [ -e $CUR_DIR/$ZIP_FILE ]
	then
		echo "Previous package found, deleting..."
		rm $CUR_DIR/$ZIP_FILE
fi

cd "$CUR_DIR/Suomalaiset käännökset"

for JSON in ./*.json
do
	if [ -f $JSON ]; then
	echo "Checking $JSON"
	$JQ_BIN . $JSON > /dev/null
	if [ $? -ge 1 ]
	then
		echo "$JSON: error found"
		exit 1
	fi
	fi
done

echo "Check done.\nZipping files to $ZIP_FILE..."

$ZIP_BIN $CUR_DIR/$ZIP_FILE *.json

echo "DONE"
