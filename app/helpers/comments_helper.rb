module CommentsHelper
  def comment_admin_commands(comment)
    if comment.author == current_user
      link_to "X", comment_path(comment), remote: true, class: 'delete-comment', :method => :delete, 
      data: {confirm: "Are you sure?"}, title: "Delete comment"
    end
  end
end
