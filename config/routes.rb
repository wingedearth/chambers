Rails.application.routes.draw do
  root 'welcome#index', page: 'index'
  resources :books, :chambers

end
