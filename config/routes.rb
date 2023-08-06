Rails.application.routes.draw do
  resources :kcomments
  devise_for :kusers, controllers: { registrations: 'registrations' } # Usa el controlador de registro personalizado

  resources :photos do
    resources :kcomments, only: [:create, :destroy]
  end

  resources :photos, only: [:index, :show, :new, :create]

  root 'photos#index'
end