class UsersController < ApplicationController

  get '/signup' do 
  	 erb :'/users/create_user'
  end

  post '/signup' do
    @user = User.create(params)
  
    if @user.save && params[:username] != "" && params[:password] != ""
      session[:user_id] = @user.id
      redirect '/tweets'
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
	user = User.find_by(:username => params[:username])
    
    if user && user.authenticate(params[:password]) && params[:username] != "" && params[:password] != ""
        session[:user_id] = user.id
        redirect '/users/home'
    else
        redirect "/failure"
    end
  end

end