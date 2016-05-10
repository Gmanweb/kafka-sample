# kafka-sample

Here you can find an implementation of a Producer and a Consumer, using Apache Kafka.
The application exposes a REST endpoint and is written in Java using Spring-Boot.

In the project you will find also an implementation using Java's Blocking Queue.

To compile and run the application, you will need Java and Maven.

##Compile
To compile type

    mvn clean package


#Running
To run, type

	java -jar target/kafka-sample.jar


Before start, you will need to install Apache Kafka.

But since the application does not create partitions programatically, you will need to create it manually
prior to run the application:

    kafka-topics --zookeeper localhost:2181 --create --topic karma-sample  --partitions 10 --replication-factor 1

