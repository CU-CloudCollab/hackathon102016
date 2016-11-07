var express = require('express');
var app = express();
var AWS = require('aws-sdk');

AWS.config.update({
  region: "us-east-1"
});

app.get('/account/:acct', function (req, res) {

  var docClient = new AWS.DynamoDB.DocumentClient();
  var table = "accounts";
  var account = req.params.acct;

  var params = {
    TableName: table,
    Key: {
      "account_num": account
    }
  };

  console.log("account was " + req.params.acct);

  docClient.get(params, function (err, data) {
    if (err) {
      console.error("Unable to read account. Error JSON:", JSON.stringify(err, null, 2));
    } else {
      console.log("Get account succeeded:", JSON.stringify(data, null, 2));
    }

    res.json(data);

  });


})

app.listen(3000, function () {
  console.log('running port 3000');
})