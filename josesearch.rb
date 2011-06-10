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
    works(params['term']).collect{ |w| w[:work] }.to_json
  end

  get '/search' do
    q = params['q']
    list = works(q)

    if list.count == 1
      if params['pjax'] == 'true'
        content_type :json 
        list.first.to_json
      else
        redirect list.first[1]
      end
    else
      if params['pjax'] == 'true'
        content_type :json
        list.to_json
      else
        haml :search, :locals => {:list => list}
      end
    end
  end

  get '/works/brochures' do
    haml :brochures, :locals => {:type => "brochures"}
  end


  def works(work=nil)
    works = [ 
              { :work => "brochures", :url => "/works/brochures" },
              { :work =>"pamphlets", :url => "/works/pamphlets"},
              { :work =>"web sites", :url => "/works/websites"},
              { :work => "videos", :url => "/works/videos"}
    ]
    return works if !work
    return works.select{ |w| w[:work].index work}
  end

    

end
