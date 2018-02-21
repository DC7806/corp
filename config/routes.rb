Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  
  #user
  scope '(:locale)', locale: /en|zh-TW/ do
    root "pages#homepage"
    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'
    get 'faq', to: 'pages#faq'
    get 'documents', to: 'pages#documents'
    resources :inquiries, only: [:new, :create]
    resources :categories, :products, :news, only: [:index, :show]
  end

  #admin
  namespace :admin, path: Settings.admin_secret_path do
    resources :news, :categories, :products, :certificates, :faqs, :milestones, except: :show
    resources :translations, only: [:index, :edit, :update]
    resources :about, :contacts, only: [:index, :create]
    get 'inquiries'
    # get 'dashboard', to: 'admin#dashboard', as: :root
  end
  
end
