AngularDnD::Application.routes.draw do
  devise_for :users
  root to: "home#index"
  

  scope "/admin" do
    get "/", :to => 'admin#index', :as => "admin_index"
    get "/*path", :constraints => {:path => /.*/}, :to => 'admin#index'
  end
  
  
  scope "/api", defaults: {format: :json} do
      scope "/menus/:menu_id" do
          get "/", to: "menu#menu"
          get "/sections", to: "menu#sections"
          get "/section/:section_id", to: "menu#section" 
          get "/section/:section_id/items", to: "menu#items"
          get "/section/:section_id/item/:item_id", to: "menu#item"
          get "/section/:section_id/item/:item_id/option_sections", to: "menu#option_sections"
          get "/section/:section_id/item/:item_id/option_section/:option_section_id", to: "menu#option_section"
          get "/section/:section_id/item/:item_id/option_section/:option_section_id/options", to: "menu#options"

          post "/sections", to: "menu_editor#create_section"
          post "/section/:section_id/items", to: "menu_editor#create_item"
          post "/section/:section_id/item/:item_id/option_sections", to: "menu_editor#create_option_section"
          post "/section/:section_id/item/:item_id/option_section/:option_section_id/options", to: "menu_editor#create_option"
      end
      scope "/restaurants/:r_id" do 
        get "/", to: "restaurant#restaurant"
        get "/ticket", to: "order_ticket#ticket"
        post "/ticket", to: "order_ticket#add_item"
        get "/menus", to: "menu#index"
        get "/menus/:m_id", to: "restaurant#menu"
        post "/menus", to: "menu_editor#create_menu"
      end
      scope "/user/restaurants" do 
        post "/", to: "admin#create_restaurant"
        get "/", to: "admin#restaurants"
      end
  end
  get "/*path", :constraints => {:path => /.*/}, :to => 'home#index' 
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
