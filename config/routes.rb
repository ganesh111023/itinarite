Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations', :omniauth_callbacks => "callbacks"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rakeget routes".

  #error pages
  # get '/404', to: 'errors#not_found'
  # get '/500', to: 'errors#server_error'
  # get '/401', to: 'errors#unauthorized'
  
  # You can have the root of your site routed with "root"
   root 'user_dashboard#index'
   get '/profile', to: 'user_dashboard#profile'
   get '/trips/:id/gallery', to: 'trips#gallery'


  resources :trips do
    resources :comments
    resources :activities, only: [] do
      put "update_photo", to: 'trip_activities#update_photo'
    end
    collection do
      get "my_trip"
    end
  end
  resources :conversations do
    collection do
      get :search_conversation_user
      get :autocomplete_user_name
    end
    resources :messages
  end


  resources :user_dashboard, only: :index do
    collection do
      get :search_user_profile
      get :autocomplete_user_name
    end
    member do
      get 'profile_search'
      post 'comment_activity'
      post 'follow'
      post 'unfollow'
      get 'following'
      get 'followers'
    end
   end
  resources :posts, only: :create do
    member do 
      post 'comment'
    end
  end


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
