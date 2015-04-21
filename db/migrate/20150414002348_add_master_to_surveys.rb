class AddMasterToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :master, :boolean
  end
end
