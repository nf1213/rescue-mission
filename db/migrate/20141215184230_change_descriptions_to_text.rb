class ChangeDescriptionsToText < ActiveRecord::Migration
  def up
    change_column :questions, :description, :text
    change_column :answers, :answer, :text
  end
  def down
    change_column :questions, :description, :string
    change_column :answers, :answer, :string
  end
end
