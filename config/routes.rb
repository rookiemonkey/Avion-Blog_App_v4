Rails.application.routes.draw do
  
  resources :articles, except: [:create]

  post '/articles/new', to: 'articles#create', as: 'post_article'

end
