class Student < ActiveRecord::Base

	extend Slugify::ClassMethods
	include Slugify::InstanceMethods

	has_many :user_students
	has_many :users, through: :user_students
	has_many :student_courses
	has_many :courses, through: :student_courses
	validates_presence_of :name, :email
end