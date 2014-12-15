class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :question

  validates :description,
    presence: true,
    length: {:minimum => 50}
end
