class AddStudentRefToClassroomStudents < ActiveRecord::Migration
  def change
    add_column :classroom_students, :student_id, :integer
  end
end
