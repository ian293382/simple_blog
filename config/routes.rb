Rails.application.routes.draw do


  get 'home/index'
  devise_for :authors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

   root to: "home#index"

  scope module: 'authors' do
    resources :posts do
      resources :elements
    end
  end

end
