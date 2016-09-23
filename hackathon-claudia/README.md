# Claudia Starter App
Claudia makes it easy to deploy Node.js projects to AWS Lambda and API Gateway. It automates all the error-prone deployment and configuration tasks, and sets everything up the way JavaScript developers expect out of the box. This means that you can get started with Lambda and API Gateway easily, and focus on solving important business problems instead of dealing with AWS deployment workflows.

Project sites:
* https://github.com/claudiajs/claudia
* https://github.com/claudiajs/claudia-api-builder

## Setup

You will need claudia installed via npm.  Then you will need to create an npm project (npm init).  
Then add the cluadia-api-builder

* npm install -g claudia
* npm init
* npm install claudia-api-builder -S

## build / deploy to aws

```
claudia create --region us-east-1 --api-module app
```

### Where to go next

Go forth and conquer the world
