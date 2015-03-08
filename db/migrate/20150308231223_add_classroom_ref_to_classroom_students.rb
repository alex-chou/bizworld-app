class AddClassroomRefToClassroomStudents < ActiveRecord::Migration
  def change
    add_column :classroom_students, :classroom_id, :integer
  end
end
