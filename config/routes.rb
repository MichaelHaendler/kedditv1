Rails.application.routes.draw do
  #get 'static_pages/front_page'
  #get 'static_pages/front_page' => 'static_pages#front_page'
root :to => 'static_pages#front_page'
  get 'users/toy1'
  get 'users/sign_in'
  get 'users/sign_up'
  post 'users/sign_up_helper'
  post 'users/sign_in_helper'
  get 'zoomy', to: 'users#toy2'

  #get 'users/:id', to: 'users#toy3' #QUESTION why was users/new being taken to users#toy3???
  #match '/:id', :to => "users#toy2", :as => :user, :via => :get
  #root 'static_pages#front_page'
  #map.login root, :controller => 'static_pages', :action => 'front_page'
resources 'users'
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
