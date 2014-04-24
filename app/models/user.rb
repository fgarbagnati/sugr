class User < ActiveRecord::Base
  has_many :morsels
  validates :username, uniqueness: true
  validates :username, :password, presence: true
end
