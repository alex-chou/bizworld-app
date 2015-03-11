class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :type

      t.timestamps
    end
  end
end
