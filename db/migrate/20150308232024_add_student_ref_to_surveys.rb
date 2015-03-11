class AddStudentRefToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :student_id, :integer
  end
end
