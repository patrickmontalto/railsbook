class Notifier
  def status(user)
    user.received_friends ? "notifications-unread" : "notifications-read"
  end
end