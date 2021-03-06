class UsersController < ApplicationController

  get '/signup' do
    erb:'users/signup'
  end

  post '/signup' do
    if User.find_by(:email => params["email"])

      redirect '/login'
    else
      user = User.create(params)
      if user.save
        session[:user_id] = user.id
        redirect '/'
      else

        redirect '/signup'
      end
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    redirect '/games'
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end




end
