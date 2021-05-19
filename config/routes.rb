Rails.application.routes.draw do

  get 'comments/create'
  get 'comments/destroy'
  root 'tweets#index'
  devise_for  :users
  resources   :users
  resources   :tweets do
    resources  :comments,  only: [:create, :destroy]
    resource   :favorites, only: [:create, :destroy]
  end

end
