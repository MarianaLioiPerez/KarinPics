Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' } # Usa el controlador de registro personalizado

  resources :photos do
    resources :comments, only: [:create, :destroy]
  end

  resources :photos, only: [:index, :show, :new, :create]

  root 'photos#index'
end