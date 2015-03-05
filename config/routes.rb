Rails.application.routes.draw do
  devise_for :users

root "application#home"

  resources :movies, only: [:index, :show, :new, :create] do
    resources :comments
  end

end
