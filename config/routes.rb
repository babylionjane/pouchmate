Rails.application.routes.draw do
  devise_for :users
  
  # 친구 기능 라우팅  
  resources :friend_requests
  get 'friends/index'
  delete 'friends/destroy/:id' => 'friends#destroy', :as => 'friends_destroy'
  
  
  # 화장품 등록 라우팅
  root 'posts#title'
  
  get 'posts/cosmetic_table'
  get 'posts/cosmetic_table/:id' => 'posts#cosmetic_table'
  get 'posts/table_move'
  get 'posts/new'
  post 'posts/create'
  get 'posts/edit/:id' => 'posts#edit'
  patch 'posts/update/:id' => 'posts#update'
  get 'posts/destroy/:id' => 'posts#destroy'
  get 'posts/janenewmypage' => 'posts#janenewmypage', :as => "posts_mypage"
  
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
