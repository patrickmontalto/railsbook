module ApplicationHelper

  def friend_request_nav
    if current_user.received_friends.any?
      render partial: 'layouts/friend_request_nav', collection: current_user.received_friends, as: :rec_friend
    else
      content_tag(:li, (link_to "You have no requests!", "#"))
    end
  end

end
