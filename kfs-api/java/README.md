# Java Starter App

## Setup

You will need the following

* JDK 1.8 
* Maven 3
* Docker (ideally docker for mac)

You can easily run a mysql database for development with:

```
docker run --name mysql -d -e MYSQL_ROOT_PASSWORD=test -p 3306:3306 dtr.cucloud.net/hackathon/mysql
```

This image has been configure specifically for the hackathon and will contain everything you need to run the starter project.
You should run the database before running any tests.

## build


Note: This first time you build all dependencies will be downloaded and this can take a while.

Note: When running maven commands without the db running you will have to skip the tests.


```
mvn clean package docker:build -DskipTests=true
```

This will build a jar pacakge under the target directory and will also build a docker images with the name dtr.cucloud.net/hackathon/hackathon-java.


### Running

You can run the web app using the spring-boot plugin.  You will need to have started the mysql DB container at this point.

```
mvn spring-boot:run
```

If all went well you can visit http://localhost:8080/ and see the hello world message.  The other example endpoints are:

http://localhost:8080/1 

This displays the decsription of the product with id of 1.  This code shows an example of using a RestController with the 
service pattern.  This pattern is necesary if business logic is to be injected into the call.

http://localhost:8080/product/1

This displays all the elments of the product with id of 1 in json format.  This is an example of using the builtin in 
RepositoryRestResource functionality which automagically displays creates rest endpoints for your table.

If you wish to run the docker container connected to the mysql container you will need to edit application.properties and change 
localhost to db:

```
spring.datasource.url= jdbc:mysql://db:3306/hackathon
```

Then you can run the following:

```
docker run --name mysql -d -e MYSQL_ROOT_PASSWORD=test -p 3306:3306 dtr.cucloud.net/hackathon/mysql
docker run --name jhack -d --link mysql:db -p 8080:8080 dtr.cucloud.net/hackathon/hackathon-java
```

### Where to go next

Go forth and conquer the world with rest and java
