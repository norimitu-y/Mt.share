module PostsHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_posts_path
    elsif action_name == 'edit' || action_name == 'edit_confirm'
      edit_confirm_posts_path
    end
  end
end
