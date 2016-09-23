Rails.application.routes.draw do
  resources :idols
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'
  resources :home, only: [:index] do
    get :policy, on: :collection
    get :question, on: :collection
  end
  get :loadmore, to: 'home#loadmore'
  resources :logged do
    collection do
      post :banner
      delete 'banner/:id', to: 'logged#destroy_banner', as: 'destroy_banner'
      get 'banner/:id', to: 'logged#edit_banner', as: 'edit_banner'
      post 'banner/:id', to: 'logged#update_banner', as: 'update_banner'
      post :rank
      delete 'rank/:id', to: 'logged#destroy_rank', as: 'destroy_rank'
      get 'rank/:id', to: 'logged#edit_rank', as: 'edit_rank'
      post 'rank/:id', to: 'logged#update_rank', as: 'update_rank'
      post :manager
      delete 'manager/:id', to: 'logged#destroy_manager', as: 'destroy_manager'
      get 'manager/:id', to: 'logged#edit_manager', as: 'edit_manager'
      post 'manager/:id', to: 'logged#update_manager', as: 'update_manager'
      get :profile
      post :update_profile
      get :new_password
      post :update_password
      post :create_policy
      post :update_policy
      post :create_question
      post :update_question
    end
  end
  resources :guest do
    get :register, on: :collection
    post :action, on: :collection
  end
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
