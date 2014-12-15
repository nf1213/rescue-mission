class ChangeAnswerColumnName < ActiveRecord::Migration
  def up
    remove_column :answers, :answer, :text
    add_column :answers, :description, :text
  end

  def down
    remove_column :answers, :description, :text
    add_column :answers, :answer, :text
  end
end
