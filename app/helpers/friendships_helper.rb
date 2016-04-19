module FriendshipsHelper

  def friends_list(user)
    render partial: 'friendships/mutual_friend', collection: user.mutual_friends.first(5), as: :friend, locals: {user: user}
  end

  def add_friend_link(user)
    if current_user != user && !current_user.mutual_friend?(user)
      link_to "Add Friend", friendships_path(:friend_id => user.id), :method => :post 
    end
  end

  def unfriend_link(user, friend)
    if current_user == user
      link_to "Unfriend", friendship_path(user.friendship(friend)), remote: true, :method => :delete, 
      data: {confirm: "Unfriend #{friend.name}?"}, title: "Unfriend #{friend.name}"
    end
  end

end
