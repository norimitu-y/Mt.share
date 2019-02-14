class CustomAuthenticationFailure < Devise::FailureApp
  protected
    def redirect_url
      posts_path 
    end
  end
