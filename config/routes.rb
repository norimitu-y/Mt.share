Rails.application.routes.draw do

  get 'users/show'

  devise_for :users
  root to: "posts#index"

  resources :users, only: [:show]

  resources :posts do
    collection do
      get :current_user_index
      post :confirm
    end
    member do
      patch :confirm
    end

    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
