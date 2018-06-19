class CoursesController < ApplicationController

	get '/courses/create_new' do
		erb :'/courses/create_course'
	end

	post '/courses/create_new' do
		@course = Course.create(params)
  		@course.teacher_id = current_user.id
  		@course.save
  		redirect '/courses/create_new'
	end

end