Rails.application.routes.draw do
  resources :urls, except: [:destroy, :update, :index, :edit]

  root 'urls#new'
  get ':id' => 'urls#redirect'

  namespace :api do
    namespace :v1 do
      resources :urls, only: :show do
        resources :stats, only: :index
      end
    end
  end

end
