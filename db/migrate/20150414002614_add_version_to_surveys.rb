class AddVersionToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :version, :integer
  end
end
