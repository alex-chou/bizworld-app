class RemoveClassroomStudents < ActiveRecord::Migration
  def up
    drop_table :classroom_students
    add_column :students, :classroom_id, :integer
  end

  def down
  end
end
