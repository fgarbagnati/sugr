class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |w|
      w.integer :follows_id # id of user who clicked "Follow me!"
      w.integer :followed_id # id of user who is being followed
    end
  end
end
