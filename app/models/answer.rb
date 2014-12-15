class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates_presence_of :user
  validates_presence_of :question

  validates :answer,
    presence: true,
    length: {minimum => 50}
end
