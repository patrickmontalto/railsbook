class MakeAcceptedDefaultInFriendships < ActiveRecord::Migration
  def up
    change_column :friendships, :accepted, :boolean, :default => false
  end

  def down
    change_column :friendships, :accepted, :boolean, :default => nil
  end
end
