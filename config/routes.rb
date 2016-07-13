Rails.application.routes.draw do
  require 'sidekiq/web'
  #mount Sidekiq::Web, at: '/sidekiq', as: 'sidekiq'
  authenticate :user, lambda { |u| u.email == 'systemadmin@mailgati.com' } do
    mount Sidekiq::Web, at: '/sidekiq', as: 'sidekiq'
  end
  match '/support/v1/EventWebHook', :to  => 'support/v1/api_tickets#event_webhook', :via => %w[POST], :defaults => { :format => 'json' }
  devise_for :users, :controllers => {:registrations => 'user/registrations'}
  namespace :admin do
    root :to => 'admin#index'
  end
  resources :email_templates do
    collection do
      get 'email_generators'
      get 'email_settings'

      post 'save_email_settings'
      post 'save_basic_settings'
    end
    member do
      post 'test'
      get 'act_on_campaign'
      get 'copy_template'
      get 'select_lists'
      post 'select_lists'
      post 'confirm_campaign'
      get 'confirm_campaign'
      get 'stats_report'
    end
  end
  # resources :companies do
  #
  # end
  resources :custom_fields
  resources :subscriber_groups do
    member do
      get 'import_subscribers'
      get 'custom_subscribers_upload'
      get 'get_header_mappers'
      post 'export_subscribers'
      post 'custom_export_subscribers'
    end
    resources :subscribers do
    end
  end
  # get '/get_import_file/:template_id', controller: 'email_templates', action: 'get_import_file'
  match '/get_import_file/(:id)', controller: :email_templates, action: :get_import_file,via: :get,as: 'get_import_file'
  match '/export_file', controller: :email_templates, action: :export_file,via: :post,as: 'export_file'

# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".

# You can have the root of your site routed with "root"
#   root 'email_templates#index'
  root 'welcome#index'

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
