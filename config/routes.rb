Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admins, controllers: {sessions: "sessions"}
  
  #user
  scope '(:locale)', locale: /en|zh-TW/ do
    root 'pages#homepage'
    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'
    get 'faq', to: 'pages#faq'
    get 'download', to: 'pages#download'
    get 'milestone', to: 'pages#milestone'
    resources :inquiries, only: [:new, :create]
    resources :categories, :news, :products, only: [:index, :show]
  end

  #admin

  namespace :admin, path: Settings.admin_secret_path do
    get Settings.admin_secret_path, to: "homepage#index", as: :admin_root
    get 'inquiries'
    resources :categories, :certificates, :downloads, :faqs, :meta, :milestones, 
              :news, :products, except: :show
    resources :translations, only: [:index, :edit, :update]
    resources :about, :contacts, :homepage, :system, only: [:index, :create]
  end
  
end
