Rails.application.routes.draw do
  
  #user
  scope '(:locale)', locale: /en|zh-TW/ do
    root "pages#homepage"
    get 'contact', to: 'pages#contact'
    get 'faq', to: 'pages#faq'
    get 'documents', to: 'pages#documents'
    resources :categories, :products, :news, only: [:index, :show]
  end

  #admin
  namespace :admin, path: Settings.admin_secret_path do
    resources :translations, :news, :categories, :products, :certificates, :faqs, except: :show
    resources :contacts, only: [:index, :create]
    # get 'dashboard', to: 'admin#dashboard', as: :root
  end
  
end
