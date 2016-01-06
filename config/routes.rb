Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index', page: 'index'
  resources :books, :chambers
  get 'chamber/:id/books', to: 'chambers#chamberbooksindex', as: :chamber_books

end
