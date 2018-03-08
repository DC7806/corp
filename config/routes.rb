Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins, controllers: {sessions: "sessions"}
  
  #user
  scope '(:locale)', locale: /en|zh-TW/ do
    root "pages#homepage"
    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'
    get 'faq', to: 'pages#faq'
    get 'download', to: 'pages#download'
    resources :inquiries, only: [:new, :create]
    resources :categories, :news, :products, only: [:index, :show]
  end

  #admin

  namespace :admin, path: Settings.admin_secret_path do
    get Settings.admin_secret_path, to: "products#index", as: :admin_root
    resources :categories, :certificates, :downloads, :faqs, :meta, :milestones, :news, :products, except: :show
    resources :translations, only: [:index, :edit, :update]
    resources :about, :contacts, :system, only: [:index, :create]
    get 'inquiries'
    root 'products#index'
  end
  
end
