Rails.application.routes.draw do

  root 'welcome#index', page: 'index'

  get '/userupdate', to: 'welcome#index_update'
  get '/readinglist', to: 'users#readinglist'
  get '/mychambers', to: 'users#mychambers'
  get '/add_to_reading/:id', to: 'books#add_to_reading_list', as: :add_to_reading_list
  get '/subscribe_chamber/:id', to: 'chambers#subscribe', as: :subscribe_chamber
  #get 'chamberbooks/:id', to: 'chambers#chamberbooks', as: :chamberbooks
  get 'chamber/:id/books', to: 'chambers#chamberbooksindex', as: :chamber_books

  resources :books, :chambers
  resources :users, only: [:new, :create, :destroy, :show, :update, :edit]
  resources :sessions, only: [:new, :create, :destroy]

  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

display

end
