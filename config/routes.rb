Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :path=>'',
                      :path_names=>{:sign_in=>'login', :sign_out=>'logout', :edit=>'profile'},
                      :controllers=>{:registrations=>'registrations',
                                      :confirmations=>'confirmations',
                                      :omniauth_callbacks => 'omniauth_callbacks'
                      }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'
  
  resources :users, only: [:show]
  resources :companies, path: 'entreprises' do
    resources :reviews, only: [:create, :destroy]
  end
  resources :photos
  
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  
  resources :subscribers, only: [:new, :update, :index]
  
  get '/search' => 'pages#search'
  get '/searchcompany' => 'pages#searchcompany'
  get '/searching' => 'pages#searching'
  
  get '/contact' => 'pages#contact'
  
  get '/politique-de-confidentialite' => 'pages#confidentialite'
  
  get '/faq' => 'pages#faq'
  
  get '/blog' => 'pages#blog'
  
  match "/404" => "errors#error404", via: [:get, :post, :patch, :delete]
  
  resources :contacts, only: [:new, :create]

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
