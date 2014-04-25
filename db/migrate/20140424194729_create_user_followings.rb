class CreateUserFollowings < ActiveRecord::Migration
  def change
    create_table :user_followings do |w|
      w.integer :follows_id
      w.integer :followed_id
    end
  end
end
