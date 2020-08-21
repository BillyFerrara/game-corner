class GamesController < ApplicationController

  get '/games' do
    if logged_in?
      @games = Game.all
      erb :'games/index'
    else
      redirect '/signup'
    end
  end

  get '/games/new' do
    erb :'/games/new'
  end

  post '/games' do
    @games = current_user.games.build(params)
    if @games.save
      puts "Done!"

      redirect '/games'
    else
        puts "Try again!"

      erb :'/games/new'
    end
  end














end
