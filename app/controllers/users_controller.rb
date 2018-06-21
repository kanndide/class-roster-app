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
    if logged_in?
      erb :'/users/home'
    else
      redirect '/login'
    end
  end

  get '/users/:slug/edit' do
    if logged_in?
      @user = current_user
    else
      redirect '/login'
    end
  end

  patch '/users/:slug/edit' do
      @user = current_user
      if params[:name] != "" || params[:period] != "" || params[:semester] != ""
        @course.name = params[:name]
        @course.period = params[:period]
        @course.semester = params[:semester]
        @course.save
        redirect "/courses"
      else
        redirect "/students/#{params[:slug]}/edit"
      end
   end

end