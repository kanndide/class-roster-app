class CoursesController < ApplicationController

	get '/courses/index' do
		@courses = current_user.courses
		erb :'/courses/index'
	end

	get '/courses/create_new' do
		erb :'/courses/create_course'
	end

	post '/courses/create_new' do
		@course = Course.create(params)
  		@course.teacher_id = Helpers.current_user.id
  		@course.save
  		redirect '/courses/create_new'
	end

	get '/courses/:slug/' do

	end

end