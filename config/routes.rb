Rails.application.routes.draw do
  #user
  scope '(:locale)', locale: /en|zh-TW/ do
    resources :categories, :products, :news, only: [:index, :show]
    root "pages#index"

  end

  #admin
  namespace :admin, path: 'corp' do
    # resources :categories, :products, :news, except: :show
    # get 'dashboard', to: 'admin#dashboard', as: :root
    resources :translations
  end
end
