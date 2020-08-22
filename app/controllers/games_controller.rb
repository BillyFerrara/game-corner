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
        puts "Try again"

      erb :'/games/new'
    end
  end

  get '/games/:id' do
    if logged_in?
      @user = current_user
      @game = Game.find_by_id(params["id"])
      erb :'games/show'
    else
      redirect '/login'
      end
  end

  get '/games/:id/edit' do
    @game = Game.find_by_id(params[:id])
    if @game.user == current_user
           erb :'games/edit'
       else
           redirect '/games'
       end
   end

  patch '/games/:id/' do
    if @game.user == current_user
      if @game.update(content: params[:content])
        redirect '/games'
      else
        erb :'games/edit'
      end
    else
      redirect '/games'
    end
  end












  # def get_game
  #   @games = Game.find_by_id(params[:id])
  # end


end
