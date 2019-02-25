module ApplicationHelper
  def resource_name
   :user
  end

  def resource
     @resource ||= User.new
  end

  def devise_mapping
     @devise_mapping ||= Devise.mappings[:user]
  end

  def check_page(controller_name, action_name)
  controller.controller_name != controller_name && controller.action_name != action_name
  end
end
