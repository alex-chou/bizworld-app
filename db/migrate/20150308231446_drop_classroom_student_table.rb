class DropClassroomStudentTable < ActiveRecord::Migration
  def up
  	drop_table :classroom_student
  end

  def down
  end
end
