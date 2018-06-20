class StudentsController < ApplicationController

	get '/students/create_new' do
		@courses = current_user.courses
  		if @courses
  			erb :'/students/create_student'
  		else
  			redirect '/login'
  		end
	end

	post '/students/create_new' do
		  @student = Student.create(params[:student])
  		@course = Course.find_by(params[:course])
      @user = current_user
  		@student.student_courses.create(course: @course)
      @student.user_students.create(user: @user)
  		@student.save
      redirect '/students/create_new'
	end

  get '/students/:slug' do
    if logged_in?
      binding.pry
      @student = current_user.students.find_by_slug(params[:slug])
      erb :'/students/show'
    else
      redirect '/login'
    end
  end

end