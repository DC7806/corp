Rails.application.routes.draw do
  #user
  scope '(:locale)', locale: /en|zh-TW/ do
    resources :categories, :products, :news, only: [:index, :show]
    root "pages#homepage"
  end

  #admin
  namespace :admin, path: 'corp' do
    resources :translations, :news, :categories, :products,  except: :show
    # get 'dashboard', to: 'admin#dashboard', as: :root
  end
end
