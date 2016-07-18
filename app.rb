require 'sinatra'
require 'sinatra/contrib'
require 'mongoid'
require './chicken'
require 'pry'

namespace '/api/v1' do
    before do
        content_type 'application/json'
    end
    get '/chicken' do
        Chicken.all.to_json
    end
end

configure do
    Mongoid.load!('./database.yml', :development)
end

get '/' do
    'hello world'
end

get '/about' do
    'I WILL EAT EVERY CHICKEN'
end

get '/chicken' do
    @chickens = Chicken.all
    erb :index
end

get '/add' do
    erb :form
end

post '/add' do
    # binding.pry
    chicken_params = {name: params[:name], color: params[:color]}
    c = Chicken.new(chicken_params)
    if c.save
        redirect '/'
    else
        redirect '/chicken'
    end
end