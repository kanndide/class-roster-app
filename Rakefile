ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

# Type `rake -T` on your command line to see the available rake tasks.

#task :your_task => :environment do
#     some code
# end

desc 'Starts a console'
task :console do
	Pry.start
end