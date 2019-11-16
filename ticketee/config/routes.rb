Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "projects/projects#index"

  namespace :projects do
    resources :projects
  end
end
