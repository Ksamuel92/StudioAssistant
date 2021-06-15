class ClientsController < ApplicationController

get '/clients' do
    # binding.pry
@client = Client.find_by(name: params[:q])
erb :"/clients/show"
end

get '/clients/:slug' do

end
end