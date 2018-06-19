class StudentsController < ApplicationContoller

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
  		@student.student_courses.create(course: @course)
  		@student.save
	end

end