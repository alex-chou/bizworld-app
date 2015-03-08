class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :school_name
      t.string :city
      t.string :state
      t.string :email
      t.string :username

      t.timestamps
    end
  end
end
