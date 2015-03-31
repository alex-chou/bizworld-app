class AddScoreToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :score, :float
  end
end
