class User < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
  has_many :facts
end
