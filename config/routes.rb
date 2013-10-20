FriendCircles::Application.routes.draw do
  get 'users/forgot' => 'users#forgot'
  post 'users/verify' => 'users#verify'
  get 'users/reset_request' => 'users#reset_request'
  post 'users/reset' => 'users#reset'
  resources :users
  resource :session
end
