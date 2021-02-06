Rails.application.routes.draw do
    
  resources :articles, except: [:create, :update]

  get '/articles/search/title',   to: 'articles#search',  as: 'search_article'
  post '/articles/new',           to: 'articles#create',  as: 'post_article'
  patch '/articles/:id/edit',     to: 'articles#update',  as: 'patch_article'

  get '/',                        to: 'articles#index',   as: 'root' # temp

end
