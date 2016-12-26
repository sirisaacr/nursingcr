Rails.application.routes.draw do
  get 'videos/new'

  get 'videos/show'

  get 'index/welcome'

  get 'index/logout'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#welcome'

  # Example of regular route:
  get 'index/login' => 'index#login'
  post 'index/iniciar_sesion' => 'index#iniciar_sesion'

  get 'articulo/new' => 'articulo#new'
  post 'articulo/create' => 'articulo#create'
  get 'articulo/show' => 'articulo#show'
  get 'articulo/all' => 'articulo#all'
  get 'articulo/delete' => 'articulo#delete'

  get 'video/new' => 'videos#new'
  post 'video/create' => 'videos#create'
  get 'video/show' => 'videos#show'
  get 'video/all' => 'videos#all'
  get 'video/delete' => 'videos#delete'
  get 'video/all' => 'videos#all'
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
