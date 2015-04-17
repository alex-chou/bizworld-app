class RemoveUsernameFromTeachers < ActiveRecord::Migration
  def change
    remove_column :teachers, :username
  end
end