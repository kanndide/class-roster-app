class StudentsController < ApplicationContoller

	get '/students/create_new' do
		erb :'/students/create_student'
	end

end