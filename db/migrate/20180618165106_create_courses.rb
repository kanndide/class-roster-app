class CreateCourses < ActiveRecord::Migration
  def change
  	create_table :courses do |t|
  		t.string :name
  		t.string :semester
  		t.integer :period
  		t.integer :user_id
  	end
  end
end
