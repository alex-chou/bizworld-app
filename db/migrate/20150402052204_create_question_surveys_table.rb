class CreateQuestionSurveysTable < ActiveRecord::Migration
  def up
    create_table :question_surveys do |t|
      t.integer :question_id
      t.integer :survey_id
    end
  end

  def down
    drop_table :question_surveys
  end
end
