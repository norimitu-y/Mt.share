module PostsHelper

  def choose_new_or_edit
    if action_name == "new"
      confirm_posts_path
    elsif action_name == "edit"
      confirm_post_path(@post.id)
    end
  end

  def new_or_edit
    if request.post?
      posts_path
    elsif request.patch?
      post_path
    end
  end  

end
