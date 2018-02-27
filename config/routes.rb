Rails.application.routes.draw do
  
  devise_for :admins
  mount Ckeditor::Engine => '/ckeditor'
  
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
    resources :categories, :certificates, :downloads, :faqs, :meta, :milestones, :news, :products, except: :show
    resources :translations, only: [:index, :edit, :update]
    resources :about, :contacts, :system, only: [:index, :create]
    get 'inquiries'
    root 'products#index'
    # get 'dashboard', to: 'admin#dashboard', as: :root
  end
  
end
