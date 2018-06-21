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

	get '/courses' do
		if logged_in?
			@courses = current_user.courses
			erb :'/courses/index'
		else
			redirect '/login'
		end
	end

	get '/courses/edit/:id' do
		if logged_in?
			@course = current_user.courses.find_by_slug(params[:id])
			erb :'/courses/edit_course'
		else
			redirect '/login'
		end
	end

	patch '/courses/edit/:id' do
	    @course = current_user.courses.find_by_id(params[:id])
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

	delete '/courses/delete/:id' do
		@course = current_user.courses.find_by_slug(params[:id])
	    if @course && @course.destroy
	      redirect '/courses'
	    else
	      redirect "/courses/#{@course.slug}"
	    end
	end

	get '/courses/:slug' do
		if logged_in?
			@courses = current_user.courses.select {|x| x if x.slug == params[:slug]}
			erb :'/courses/index'
		else
			redirect '/login'
		end
	end

	get '/courses/:slug/:id' do
		if logged_in?
			@course = current_user.courses.find_by_id(params[:id])
			erb :'/courses/show'
		else
			redirect '/login'
		end
	end

end