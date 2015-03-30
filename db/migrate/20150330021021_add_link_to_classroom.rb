class AddLinkToClassroom < ActiveRecord::Migration
  def change
    add_column :classrooms, :link, :text
    add_column :classrooms, :short_link, :text
  end
end
