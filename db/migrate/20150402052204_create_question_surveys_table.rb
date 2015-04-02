class CreateQuestionSurveysTable < ActiveRecord::Migration
  def up
    create_table :question_surveys
  end

  def down
    drop_table :question_surveys
  end
end
