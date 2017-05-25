Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  
#  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, :controllers => { registrations: 'registrations' }
  
  root 'topics#index'
  get 'topics/about', to: 'topics#about', as: 'about'
  resources :topics do
    resources :comments
  end
  
  get 'topics/show', to: 'topics#show', as: 'show_path'
  get '/profile/', to: 'profile#index'
  get '/profile/edit', to: 'profile#edit'
  get '/profile/userlist', to: 'profile#userlist'
 
end
