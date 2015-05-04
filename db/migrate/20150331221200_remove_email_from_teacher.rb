class RemoveEmailFromTeacher < ActiveRecord::Migration
  def change
    remove_column :teachers, :email
  end
end
