class CreateQuestions < ActiveRecord::Migration
  def up
    create_table :questions
  end

  def down
    drop_table :questions
  end
end
