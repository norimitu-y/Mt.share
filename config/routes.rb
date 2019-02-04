Rails.application.routes.draw do

  devise_for :users
  root to: "posts#index"

  resources :posts do
    collection do
      get :current_user_index
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
