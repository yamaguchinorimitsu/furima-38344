Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  #今は不要  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
  #end

end
