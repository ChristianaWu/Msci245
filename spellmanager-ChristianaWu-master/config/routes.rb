Rails.application.routes.draw do
  root to: 'static_pages#home'
  resources :books
  resources :spells
    
  get 'spells/:id/add_spell', to: 'spells#add_spell', as: 'add_spell_spell'
  get 'books/:id/add_spell', to: 'books#add_spell', as: 'add_spell_book'
  
  post 'books/:id', to: 'books#add', as: 'add_in_book' 
  post 'spells/:id', to: 'spells#add', as: 'add_in_spell' 
    
  delete 'books/:id/spell', to: 'books#remove_spell', as: 'remove_spell'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
