Rails.application.routes.draw do
  get 'profiles/show'
  devise_for :users
  resources :meows do
    member do
      get 'toggle_like', to: 'meows#toggle_like'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'meows#index'
  get 'profile' => 'profiles#show'
end
