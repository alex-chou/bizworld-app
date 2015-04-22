class AddCityNameToStudents < ActiveRecord::Migration
  def change
    add_column :students, :city_name, :string
  end
end
