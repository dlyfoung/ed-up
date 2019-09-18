Rails.application.routes.draw do
  root 'login#sign_in'

  resources :users, :resources

  get 'login/sign_in'
  post 'login/sign_in'
  get 'login/log_out'
  
end
