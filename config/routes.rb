Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Ckeditor::Engine => '/ckeditor'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'biography' => 'pages#biography', :as => :biography
  get 'links' => 'pages#links', :as => :links
  get 'workshops' => 'pages#workshops', :as => :workshops
  get 'portraits' => 'galleries#portraits', :as => :portraits, :id => Gallery.find_by_name('Portraits').try(:id)
  get 'blog' => 'blog#index', :as => :blog
  get 'blog/post/:id' => 'blog#show', :as => :post

  resources :galleries, :only => [:show] do
    resources :paintings, :only => [:index, :show]
  end

  root :to => 'pages#home'
end
