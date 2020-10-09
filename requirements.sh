#!/bin/bash



get-lts () {
if test -s atlassian-confluence-7.4.4.tar.gz
	then echo "confluence lts exists"
	else https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-7.4.4.tar.gz
fi

}


get-latest () {
if test -s atlassian-confluence-7.7.3.tar.gz
	then echo "confluence exists"
	else wget https://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-7.7.3.tar.gz
fi

}

get-connector () {
if test -s mysql-connector-java-8.0.21.tar.gz
	then echo "mysqljava-connector exists"
	else wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.21.tar.gz
fi
}

tar xzvf  *confluence*tar.gz
sleep 1
tar xzvf  mysql-connector-java-*.tar.gz


#get-lts
get-latest
get-connector
