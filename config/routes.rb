Rails.application.routes.draw do
  root 'login#sign_in'

  resources :users, :resources

  get 'login/sign_in'
  post 'login/sign_in'
  #get 'resources/new'
  #get 'resources/update'
  #get 'resources/delete'
  #post 'resources/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
