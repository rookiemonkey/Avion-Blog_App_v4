Rails.application.routes.draw do
  
  get '/', to: 'articles#index', as: 'root' # temp

  
  resources :articles, except: [:create, :update]
  post '/articles/new', to: 'articles#create', as: 'post_article'
  patch '/articles/:id/edit', to: 'articles#update', as: 'patch_article'

end
