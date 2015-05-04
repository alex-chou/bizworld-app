class RemoveSurveyVersion < ActiveRecord::Migration
  def change
    remove_column :surveys, :version
  end
end
