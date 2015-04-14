class AddSchoolNameToStudents < ActiveRecord::Migration
  def change
    add_column :students, :school_name, :string
  end
end
