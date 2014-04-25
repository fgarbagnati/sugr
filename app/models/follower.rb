class Follower < ActiveRecord::Base
  scope :follower, ->(session_id) {where(':follows_id = ?', session_id)}

end
