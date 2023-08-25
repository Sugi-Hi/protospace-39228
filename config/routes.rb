Rails.application.routes.draw do
  devise_for :users
  resources :prototypes , only: [:new, :create, :destroy, :edit, :update, :show]  do
    #resources :prototypes(全部メソッド)
    resources :comments , only: :create
  end
  resources :users , only: :show
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "prototypes#index"
end

