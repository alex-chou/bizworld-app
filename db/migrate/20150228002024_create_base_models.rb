class CreateBaseModels < ActiveRecord::Migration
  def up
    create_table :teachers do |t|
      t.string :name
    end
    create_table :classrooms do |t|
      t.belongs_to :teacher, index: true
      t.belongs_to :student, index: true
    end
    create_table :students do |t|
      t.string :name
    end
    create_table :surveys do |t|
      t.belongs_to :student, index: true
      t.string :name
    end
  end

  def down
    drop_table :teachers
    drop_table :classrooms
    drop_table :students
    drop_table :surveys
  end
end
