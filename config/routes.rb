Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'deliveries(/:destination)', to: 'deliveries#new', as: 'deliveries_new'
  get 'routes/:begin/:end', to: 'routes#show', as: 'routes_show'

  post 'deliveries/create'

  root to: 'application#root_redirect_to'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
