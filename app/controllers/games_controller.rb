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

      redirect '/games'
    else

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

  patch '/games/:id' do
     @game = Game.find_by_id(params[:id])
     if @game.user = current_user
       @game.update(params["game"])
       redirect '/games'
    end
   end

   delete '/games/:id' do
     @game = Game.find_by_id(params[:id])
     if @game.user = current_user
       @game.delete
     end
     redirect '/games'
   end





end
