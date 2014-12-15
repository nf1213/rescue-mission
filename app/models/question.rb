class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  validates_presence_of :user

  validates :title,
    presence: true,
    length: {:minimum => 40}

  validates :description,
    presence: true,
    length: {:minimum => 150}

end
