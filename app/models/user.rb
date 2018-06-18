class User < ActiveRecord::Base
	has_many :courses
	has_many :students, through: :courses
	has_secure_password
	validates_presence_of :name, :email, :username, :password
end