Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index', page: 'index'
  resources :books, :chambers

end
