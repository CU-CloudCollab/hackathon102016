#!/usr/bin/env ruby

require 'aws-sdk'
require 'csv'

Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::SharedCredentials.new(profile_name: "training")
})

dynamodb = Aws::DynamoDB::Client.new

CSV.foreach('accounts.csv', 'r') do |row|
  #puts "#{row[0]} -- #{row[1]} -- #{row[2]}"
  resp = dynamodb.update_item({
    table_name: "accounts", # required
    key: { # required
      "account_num" => row[1], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
    },
    attribute_updates: {
      "coa_cd" => {
        value: row[0], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
        action: "PUT", # accepts ADD, PUT, DELETE
      },
      "active" => {
        value: row[2], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
        action: "PUT", # accepts ADD, PUT, DELETE
      },
    },
  })
end
