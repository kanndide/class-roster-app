class User < ActiveRecord::Base
	has_many :courses
	has_many :user_students
	has_many :students, through: :user_students
	has_secure_password
	validates_presence_of :name, :email, :username, :password
end