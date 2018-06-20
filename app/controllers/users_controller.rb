class UsersController < ApplicationController

  get '/signup' do 
    if logged_in?
      redirect '/users/home'
    else
      erb :'/users/create_user'
    end
  end

  post '/signup' do
    @user = User.create(params)
  
    if @user.save && params[:username] != "" && params[:password] != ""
      session[:user_id] = @user.id
      redirect '/user/home'
    else
      redirect '/signup'
    end
  end

  get '/login' do
  	if logged_in?
    	redirect '/'
    else
  		erb :'/users/login'
  	end
  end

  post "/login" do
	  @user = User.find_by(:username => params[:username])
   
    if @user && @user.authenticate(params[:password]) && params[:username] != "" && params[:password] != ""
        session[:user_id] = @user.id
        redirect '/'
    else
        redirect "/failure"
    end
  end

  get '/users/home' do
    erb :'/users/home'
  end

end