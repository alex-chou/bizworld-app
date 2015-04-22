class AddTeacherNameToStudents < ActiveRecord::Migration
  def change
    add_column :students, :teacher_name, :string
  end
end
