module FriendshipsHelper

  def friends_list(user)
    render partial: 'friendships/mutual_friend', collection: user.mutual_friends.first(5), as: :friend, locals: {user: user}
  end

  def friend_link(user)
    if current_user != user && !current_user.mutual_friend?(user)
      link_to "Add Friend", friendships_path(:friend_id => user.id), :method => :post, class: 'add-friend-link'
    elsif current_user != user && current_user.mutual_friend?(user)
      link_to "Unfriend", friendship_path(current_user.friendship(user)), remote: true, :method => :delete, 
      data: {confirm: "Unfriend #{user.name}?"}, title: "Unfriend #{user.name}", class: 'remove-friend-link'
    end
  end
end
