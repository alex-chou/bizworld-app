class CreateBaseModels < ActiveRecord::Migration
  def up
    create_table :teachers do |t|
      t.string :name
      t.string :school_name
      t.string :city
      t.string :state
      t.string :email
      t.string :username
    end

    create_table :classrooms do |t|
      t.string :name
      t.string :program
      t.string :class_type
      t.datetime :start_date
      t.datetime :end_date
    end

    create_table :classroom_student do |t|
      t.belongs_to :student, index: true
      t.belongs_to :classroom, index: true
    end

    create_table :students do |t|
      t.string :name
      t.string :grade
      t.string :gender
      t.string :ethnicity
    end

    create_table :surveys do |t|
      t.belongs_to :student, index: true
      t.string :type
    end
  end

  def down
    drop_table :teachers
    drop_table :classrooms
    drop_table :students
    drop_table :surveys
  end
end
