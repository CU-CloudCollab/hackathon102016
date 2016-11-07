#!/usr/bin/env ruby

require 'aws-sdk'
require 'csv'

Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::SharedCredentials.new(profile_name: "training")
})

dynamodb = Aws::DynamoDB::Client.new

CSV.foreach('subaccounts.csv', 'r') do |row|
  #puts "#{row[0]} -- #{row[1]} -- #{row[2]}"
  resp = dynamodb.update_item({
    table_name: "subaccounts", # required
    key: { # required
      "subaccount_account" => "#{row[1]}-#{row[2]}", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
    },
    attribute_updates: {
      "coa_cd" => {
        value: row[0], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
        action: "PUT", # accepts ADD, PUT, DELETE
      },
      "active" => {
        value: row[3], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
        action: "PUT", # accepts ADD, PUT, DELETE
      },
      "account_num" => {
        value: row[1], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
        action: "PUT", # accepts ADD, PUT, DELETE
      },
      "subaccount_num" => {
        value: row[2], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
        action: "PUT", # accepts ADD, PUT, DELETE
      },
    },
  })
end
