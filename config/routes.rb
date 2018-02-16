Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
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
    resources :news, :categories, :products, :certificates, :faqs, except: :show
    resources :translations, only: [:index, :edit, :update]
    resources :contacts, only: [:index, :create]
    # get 'dashboard', to: 'admin#dashboard', as: :root
  end
  
end
