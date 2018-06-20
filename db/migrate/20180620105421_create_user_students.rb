class CreateUserStudents < ActiveRecord::Migration
  def change
  	create_table :user_students do |t|
  		t.integer :student_id
  		t.integer :user_id
  	end
  end
end
