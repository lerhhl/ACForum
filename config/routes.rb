Rails.application.routes.draw do
#  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => { registrations: 'registrations' }
  
  root 'topics#index'
  
  resources :topics do
    resources :comments
  end
  
  get 'topics/show', to: 'topics#show', as: 'show_path'


end
