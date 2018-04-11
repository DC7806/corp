Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, controllers: {sessions: "sessions", registrations: "registrations"}

  #user
  scope '(:locale)', locale: /en|zh-TW/ do
    root 'pages#homepage'
    get 'about', to: 'pages#about'
    get 'contact', to: 'pages#contact'
    get 'faq', to: 'pages#faq'
    get 'download', to: 'pages#download'
    get 'milestones', to: 'pages#milestones'
    get 'search', to: 'pages#search'
    resources :inquiries, only: [:new, :create]
    resources :categories, :news, :products, only: [:index, :show]
    get '/inquiries', to: redirect('/contact')
  end

  #admin
  namespace :admin, path: Settings.admin_secret_path do
    root 'homepage#index'
    get 'inquiries'
    resources :categories, :carousels, :certificates, :companies,:downloads, :faqs, :meta, :milestones, 
              :news, :offices,except: :show
    resources :about, :contacts, :homepage, :system, only: [:index, :create]
    resources :products, except: :show do
      member do
        patch 'publish'
      end
    end
    resources :translations, only: :index do
      collection do
        put 'update_all'
      end
    end
  end
  
end
