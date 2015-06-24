Rails.application.routes.draw do
  resources :stats
  resources :urls

  root 'urls#new'
  get ':id' => 'urls#redirect'

end
