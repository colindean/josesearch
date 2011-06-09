require 'bundler'
Bundler.require

class JoseSearch < Sinatra::Base; end;
require_relative "config/config"

class JoseSearch

  get '/' do
    haml :index
  end

end
