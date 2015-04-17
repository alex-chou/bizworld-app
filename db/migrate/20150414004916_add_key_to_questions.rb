class AddKeyToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :key, :string
  end
end
