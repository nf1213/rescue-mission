class User < ActiveRecord::Base
  has_many :questions
  has_many :answers

  validates_presence_of :user_name
end
