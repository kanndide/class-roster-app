class Course < ActiveRecord::Base
	extend Slugify::ClassMethods
	include Slugify::InstanceMethods

	belongs_to :user
	has_many :student_courses
	has_many :students, through: :student_courses
	validates_presence_of :name, :semester, :period, :user_id
end