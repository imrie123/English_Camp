Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users, only: [:create] do
    collection do
      post :sign_in
    end
  end

end
