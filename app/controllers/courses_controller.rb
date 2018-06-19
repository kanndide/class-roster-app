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
  		@course.user_id = current_user.id
  		@course.save
  		redirect '/courses/create_new'
	end

	get '/courses/:slug' do
		if logged_in?
			@courses = current_user.courses.select {|x| x.name}
			erb :'/courses/show'
		else
			redirect '/login'
		end
	end

end