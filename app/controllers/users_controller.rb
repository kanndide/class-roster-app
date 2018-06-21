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
      redirect '/users/home'
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
    if logged_in?
      erb :'/users/home'
    else
      redirect '/login'
    end
  end

  get '/users/:slug/edit' do
    if logged_in?
      @user = current_user
      erb :'/users/edit_user'
    else
      redirect '/login'
    end
  end

  patch '/users/:slug/edit' do
      @new_info = params[:user].select {|key, value| value != ""}
      @user = current_user
      
      if @user && @user.authenticate(params[:new_password][:password]) && @new_password
        @user.update(password: @new_password)
      elsif @new_info
        @user.update(@new_info)    
      end
      redirect "/users/#{@user.slug}/edit"
   end

   get '/users/:slug/edit_password' do
      if logged_in?
        @user = current_user
        erb :'/users/edit_password'
      else
        redirect '/login'
      end
   end

   patch '/users/:slug/edit_password' do
      @user = current_user
      @new_password = params[:new_password][:new_pass1] if params[:new_password][:new_pass1] == params[:new_password][:new_pass2] && params[:new_password][:new_pass1] != ""
      binding.pry
      if @user && @user.authenticate(params[:new_password][:password]) && @new_password
        @user.update(password: @new_password)
        redirect "/users/#{@user.slug}/edit"
      else
        redirect "/users/#{@user.slug}"
      end

    end

   delete '/users/:slug/delete' do
      @user = current_user

      if @user && @user.destroy && @user.authenticate(params[:password])
        session.clear
        redirect '/delete_successful'
      else
        redirect "/students/#{@user.slug}"
      end
   end

end