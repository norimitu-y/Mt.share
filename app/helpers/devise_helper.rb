module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    html = ""
    messages = resource.errors.full_messages.each do |errmsg|
      html += <<-EOF
      <div uk-alert class="uk-alert-danger">
        <a class="uk-alert-close" uk-close></a>
        <ul>
          <li>#{errmsg}</li>
        </ul>  
      </div>
      EOF
    end
    html.html_safe
  end

  def devise_error_messages?
    resource.errors.empty? ? false : true
  end

end
