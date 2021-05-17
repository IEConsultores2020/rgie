Rails.application.routes.draw do

  resources :kardexes
  resources :conteos do
    collection { post :import }
  end
  resources :personas

  resources :regions

  resources :venta

  resources :equipos

  resources :fabricantes

  resources :visita

  resources :planvisita 

  resources :puntoventa

  resources :ciudads do
    collection { post :import }
  end

  resources :departamentos do
    collection { post :import }
  end

  resources :pais do
    collection { post :import }
  end

  resources :canals

  resources :tipocanals

  devise_for :users
  
  scope "/admin" do
    resources :users do
    collection { post :import }
    end    
  end
  
  resources :roles

  resources :users 

  resources :inventarios do
    collection { post :import }
    collection { get :imprimir_datos }   
    collection { get :imprimir_codbarras }
  end

  resources :tiendas

  resources :articulos do
    get 'reporte'  => 'articulos#reporte' 
    collection { post :import }    
  end

  resources :modelos 

  resources :componentes

  resources :medidas

  resources :empresas

  authenticated :user do
     #root to: "planvisita#index", as: :authenticated_root          
  end 
  root to: "welcome#index"
 
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
