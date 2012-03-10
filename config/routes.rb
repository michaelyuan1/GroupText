Grouptext::Application.routes.draw do
  
  
  resources :sessions,      :only => [:new, :create, :destroy]
  resources :phonenumbers
  
  resources :users do
    collection do
      get 'compose_message'
      post 'send_message'
    end
  end
  
  root :to => "pages#home"

  match '/contact', :to => 'pages#contact'
  match '/about',   :to => 'pages#about'
  match '/help',    :to => 'pages#help'
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match 'send_message', :to => 'users#send_message'
  
 

end
