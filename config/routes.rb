PixelflowBlog::Application.routes.draw do
  resources :lectures

  resources :blog_posts
  root to: 'blog_posts#index'
  get 'login', to: 'sessions#login'
end
