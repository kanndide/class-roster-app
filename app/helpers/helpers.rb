class Helpers
	def logged_in?
	  !!current_user
 	end

	def current_user
	  @current_user ||= Teacher.find(session[:user_id]) if session[:user_id] ||= Student.find(session[:user_id]) if session[:user_id] 
	end
end