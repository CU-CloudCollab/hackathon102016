require 'sinatra/base'
require 'json'
require 'aws-sdk'
require 'sinatra/activerecord'

class App < Sinatra::Base
  Aws.config.update({
    region: 'us-east-1'
  })

  set :bind, "0.0.0.0"

  get "/" do
    "<p>The site is up!</p>"
  end

  # IT-R74759--0500---
  get '/accounts/:id' do
    content_type :json

    account_string = params[:id]
    puts account_string
    account_parts = account_string.split('-')
    puts account_parts.inspect

    if account_parts.length < 2
      halt 598, "{\"error\": \"account string too short\"}"
    end

    if validate_account_num?(account_parts[1])
      "{\"Success\": \"account string is awesome\"}"
    else
      "{\"error\": \"account string not valid\"}"
    end

    if account_parts.length > 2 && validate_sub_account_num?(account_parts[2])
      "{\"Success\": \"account string is awesome\"}"
    else
      "{\"error\": \"account string not valid\"}"
    end
  end

  def validate_account_num?(account_num)
    return false if account_num.empty?
    return false unless account_num.scan /(?<=#)[[:alnum:]]+/

    dynamodb = Aws::DynamoDB::Client.new
    resp = dynamodb.get_item({
      table_name: "accounts", # required
      key: { # required
        "account_num" => account_num, # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      },
      attributes_to_get: ["active"],
    })

    resp.item["active"].eql?("Y")
  end

  def validate_sub_account_num?(sub_account_num, account_num)
    return false if sub_account_num.empty?
    return false unless sub_account_num.scan /(?<=#)[[:alnum:]]+/

    dynamodb = Aws::DynamoDB::Client.new
    resp = dynamodb.get_item({
      table_name: "subaccounts", # required
      key: { # required
        "subaccount_account" => "#{account_num}-#{sub_account_num}", # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      },
      attributes_to_get: ["active"],
    })

    resp.item["active"].eql?("Y")
  end

end
