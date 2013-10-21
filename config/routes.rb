FriendCircles::Application.routes.draw do
  get 'users/forgot' => 'users#forgot'
  post 'users/verify' => 'users#verify'
  get 'users/reset_request' => 'users#reset_request'
  post 'users/reset' => 'users#reset'
  resources :users do
    resources :friend_circles
  end
  resource :session
  resources :posts
  resources :links
end
