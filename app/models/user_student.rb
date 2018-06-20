class UserStudent < ActiveRecord::Base
	belongs_to :user
	belongs_to :student
	validates_presence_of :user_id, :student_id
end