class Student < ActiveRecord::Base
	has_many :users
	has_many :student_courses
	has_many :courses, through: :student_courses
	validates_presence_of :name, :email
end