Rails.application.routes.draw do

  resources :incident_assignments

  resources :timers

   # resources :tasks

  resources :entries

  resources :asset_roles

  resources :locations

  resources :scene_types

  resources :scene_assignments

  resources :scenes

  resources :assets
  resources :incidents do

    resources :tasks
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'incidents#new'
  get 'incidents/:id/deployRIT', to: 'incidents#deployRIT', :as => "deployRIT"

  # Example of regular route:
    #get 'measures/complete' => 'measure#complete'

  # Example of named route that can be invoked with purchase_url(id: product.id)
     # get 'incidents/:id/deployRIT', to: 'incident#deployRIT'
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
