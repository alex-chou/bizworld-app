class AddStateToStudents < ActiveRecord::Migration
  def change
    add_column :students, :state, :string
  end
end
