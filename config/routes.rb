Catfax::Application.routes.draw do
  root to: 'home#index'


  scope :api do
    resources :cats, only: [:show, :index]
  end
end
