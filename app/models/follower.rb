class Follower < ActiveRecord::Base
   scope :following, ->(signed_in_user_id) {where "follows_id = ?", signed_in_user_id}
end
