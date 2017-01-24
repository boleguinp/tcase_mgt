Rails.application.routes.draw do
  # Main routes
  get 'welcome/index'
  root 'welcome#index'

  # Projects
  resources :projects do
    resources :t_cases
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
