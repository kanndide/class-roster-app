class ApplicationController < Sinatra::Base
	register Sinatra::ActiveRecordExtension
	set :views, Proc.new { File.join(root, "../views/") }
	enable :sessions
	set :sesion_secret, "my_application_secret"

	get '/' do
		erb :index
	end

	get '/failure' do
	  erb :'/public/failure'
	end

	get '/logout' do
	 session.clear
	  redirect "/login"
	end

	helpers do
	  def logged_in?
	    !!current_user
	  end

	  def current_user
	    @current_user ||= Teacher.find(session[:user_id]) if session[:user_id] ||= Student.find(session[:user_id]) if session[:user_id] 
	  end
	end
end