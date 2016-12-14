FROM relateiq/oracle-java7

RUN apt-get update && apt-get install -y wget

RUN mkdir /data /logs /kafka

RUN wget --progress=dot:mega -O - http://apache.claz.org/kafka/0.8.2.2/kafka_2.10-0.8.2.2.tgz | tar -zx -C /kafka --strip-components=1

# RUN cd kafka && ./gradlew jar

VOLUME [ "/data", "/logs" ]

# primary, jmx
EXPOSE 9092 7203

ADD http://repo1.maven.org/maven2/org/slf4j/slf4j-log4j12/1.7.6/slf4j-log4j12-1.7.6.jar /kafka/lib/slf4j-log4j12.jar
ADD config /kafka/config
ADD start.sh /start.sh

CMD ["/start.sh"]
