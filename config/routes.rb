Rails.application.routes.draw do
  # get 'comments/index'

  # get 'comments/edit'

  # get 'comments/new'

  # get 'comments/show'

  # get 'user/index'

  # get 'user/edit'

  # get 'user/new'

  # get 'user/show'

  # get 'post/index'

  # get 'post/edit'

  # get 'post/new'

  # get 'post/show'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'users#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :users

    post '/signin', to:'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    post '/follow/:id', to: 'users#follow', as: 'follow'
    get '/profile', to: 'users#profile'
    post '/unfollow/:id', to: 'users#unfollow', as: 'unfollow'

    resources :users do 
      member do 
        get :following, :followers
      end 
    end




    resources :posts do
      resources :comments
    end
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
