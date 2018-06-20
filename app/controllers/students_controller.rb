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
      @student = current_user.students.find_by_slug(params[:slug])
      erb :'/students/show'
    else
      redirect '/login'
    end
  end

  get '/students/:slug/edit' do
    if logged_in?
      @student = current_user.students.find_by_slug(params[:slug])
      erb :'/students/edit_student'
    else
      redirect '/login'
    end
  end

  patch '/students/:slug' do
    @student = current_user.students.find_by_slug(params[:slug])
    if params[:name] != "" || params[:email] != ""
      @student.name = params[:name]
      @student.email = params[:email]
      @student.save
      redirect "/students/#{@student.slug}"
    else
      redirect "/students/#{params[:slug]}/edit"
    end
  end

  delete '/students/:slug/delete' do
    @student = current_user.students.find_by_slug(params[:slug])
    if @student && @student.destroy
      redirect '/courses'
    else
      redirect "/students/#{@student.slug}"
    end
  end

end