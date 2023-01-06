Rails.application.routes.draw do
  scope '(:locale)', locale: /en|es/ do
    get 'home/grettings'
    namespace :v1, defaults: { format: 'json' } do
      resources :users, only: %i[ create ] do
        post 'login', on: :collection
      end
    end
  end
end
