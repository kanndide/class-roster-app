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

end