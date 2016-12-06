Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'deliveries/new'

  post 'deliveries/create'

  root 'deliveries#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
