class ApplicationController < Sinatra::Base
	configure do
		register Sinatra::ActiveRecordExtension
		set :views, Proc.new { File.join(root, "../views/") }
		enable :sessions
		set :session_secret, "my_application_secret"
	end

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

	get '/delete_successful' do
		erb :'/public/delete_successful'
	end

	def logged_in?
	  !!current_user
 	end

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

end