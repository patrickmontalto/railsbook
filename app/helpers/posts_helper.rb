module PostsHelper

  def comments_for(post)
    if show_all_comments?(post)
      render post.comments
    else
      render post.comments.last(2)
    end
  end

  def post_admin_commands(post)
    if post.author == current_user
      link_to "X", post_path(post), remote: true, class: 'delete-post pull-right', :method => :delete, 
      data: {confirm: "Are you sure?"}, title: "Delete post"
    end
  end

  private
    def view_more(post)
      if post.comments.size > 2 && ! show_all_comments?(post)
        render "comments/view_more", post: post
      end
    end

    def show_all_comments?(post)
      params[:post_id].to_i == post.id
    end
end
