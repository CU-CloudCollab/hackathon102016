require 'sinatra/base'
require 'json'
require 'aws-sdk'
require 'sinatra/activerecord'

class App < Sinatra::Base
  Aws.config.update({
    region: 'us-east-1',
  })

  set :bind, "0.0.0.0"

  get "/" do
    "<p>The site is up!</p>"
  end

  get '/accounts/:id' do
    dynamodb = Aws::DynamoDB::Client.new
    resp = dynamodb.get_item({
      table_name: "accounts", # required
      key: { # required
        "account_num" => params[:id], # value <Hash,Array,String,Numeric,Boolean,IO,Set,nil>
      },
      attributes_to_get: ["active"],
    })

    resp.item["active"]
  end

end
