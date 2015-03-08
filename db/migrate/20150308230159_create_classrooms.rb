class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :program
      t.string :class_type
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
