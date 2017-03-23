Rails.application.routes.draw do
  get 'user/show'

  get 'profiles/show'
  get 'user/show'
  devise_for :users
  resources :meows do
    member do
      get 'toggle_like', to: 'meows#toggle_like'
    end
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'meows#index'
  get 'profile' => 'profiles#show'
  get 'user' => 'user#show'
  get 'toggle_follow' => 'user#toggle_follow'
end
