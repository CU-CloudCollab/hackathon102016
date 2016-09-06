# Sinatra Starter App

## Setup

You will need the following

* Ruby 2.2.2 (ideally using rvm)
* Docker (ideally docker for mac)

You can easily run a mysql database for development with:

```
docker run --name mysql -d -e MYSQL_ROOT_PASSWORD=test -p 3306:3306 dtr.cucloud.net/hackathon/mysql
```

This image has been configure specifically for the hackathon and will contain everything you need to run the starter project.
You should run the database before running any tests.

## build

`bundle install`

### Running


```
bundle exec rackup --host 0.0.0.0 -p 5000
```

If all went well you can visit http://localhost:5000/ and see the hello world message.  The other example endpoints are:

http://localhost:5000/products/1

This displays all the elments of the product with id of 1 in json format.

If you wish to run the docker container connected to the mysql container you can run the following:

```
docker run --name mysql -d -e MYSQL_ROOT_PASSWORD=test -p 3306:3306 dtr.cucloud.net/hackathon/mysql
docker run --name shack -d --link mysql:db -p 5000:5000 dtr.cucloud.net/hackathon/hackathon-sinatra
```

### Where to go next

Go forth and conquer the world with rest and ruby and sinatra
