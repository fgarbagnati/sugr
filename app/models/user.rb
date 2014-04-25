class User < ActiveRecord::Base

  # include Gravtastic
  # gravtastic   :secure => true,
  #              :filetype => :gif,
  #              :size => 240

  has_many :morsels
  validates :username, uniqueness: true
  validates :username, :password, presence: true
  # validates :email, uniqueness: true

  # def self.fetch_gravatar(user_id)
  #   current_user = User.find(user_id)
  #   current_user.gravatar_url
  # end

end
