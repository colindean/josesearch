require 'bundler'
Bundler.require

class JoseSearch < Sinatra::Base; end;
require_relative "config/config"

class JoseSearch

  get '/' do
    haml :index
  end

  get '/suggestions.json' do 
    content_type :json
    ["brochures","pamphlets","web sites"].to_json
  end

end
