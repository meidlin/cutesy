Rails.application.routes.draw do
  resources :pet_kinds
  resources :breeds
  get 'pets/leader' => 'pets#leader'
  resources :pets
  resources :images
  resources :users
  # resources :ratings, only: [:create]

  

  get 'sessions/edit' => 'sessions#edit'


  root 'application#index' 

  get 'auth/twitter/callback', to: 'sessions#create'

  get 'betasignup' => 'betasignup#betasignup'
  get 'betasignup/2' => 'betasignup#betasignup2', as: :betasignup2
  put 'betasignup/2' => 'betasignup#update'
  patch 'betasignup/2' => 'betasignup#update'
  get 'betasignup/3' => 'betasignup#betasignup3', as: :betasignup3

  scope 'api', defaults: {format: :json} do
    resources :sessions, only: [:index, :create, :update, :destroy]
  end

  scope 'petsapi', defaults: {format: :json} do
    resources :pets, only: [:index, :create, :update, :destroy]
  end

#  scope 'api', defaults: {format: :json} do
    resources :ratings, only: [:create]
#  end

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
