require 'sinatra/base'
require 'json'
require 'aws-sdk'
require 'sinatra/activerecord'

class Product < ActiveRecord::Base
end

class App < Sinatra::Base
  set :bind, "0.0.0.0"

  get "/" do
    "<p>The site is up!</p>"
  end

  get '/products' do
    @products = Product.all

    content_type :json
    "#{@products.as_json}"
  end

  get '/products/:id' do
    @product = Product.find_by_id(params[:id])

    content_type :json
    "#{@product.as_json}"
  end

  post '/products' do
    payload = JSON.parse(request.body.read)
    @product = Product.create(
      version: payload['version'],
      price: payload['price'].to_f,
      image_url: payload['image_url'],
      product_id: payload['product_id'],
      description: payload['description'])

      content_type :json
      "#{@product.as_json}"
  end

  put '/products/:id' do
    payload = JSON.parse(request.body.read)
    @product = Product.find(params[:id])

    if @product
      @product.version = payload['version']
      @product.price = payload['price'].to_f
      @product.image_url = payload['image_url']
      @product.product_id = payload['product_id']
      @product.description = payload['description']
      @product.save
    else
      halt 404, "Product not found"
    end

    content_type :json
    "#{@product.as_json}"
  end

  delete '/products/:id' do
    @product = Product.find(params[:id])

    if @product
      @product.destroy
    else
      halt 404, "Product not found"
    end

    200
  end

end
