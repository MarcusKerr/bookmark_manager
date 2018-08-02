# Carry on here in Walkthrough: We can now flesh out the route, saving the submitted data to the database:
# Controller class
require 'sinatra/base'
require 'sinatra/flash'
require './models/bookmark'


class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    # p ENV
    @bookmarks = Bookmark.all
    erb :index
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    if Bookmark.validate(params[:url])
      redirect '/bookmarks'
    else
      flash[:invalid_url] = "Invalid URL"
      redirect '/bookmarks/new'
    end
  end

  run! if app_file == $0
end
