Rails.application.routes.draw do
  # Main routes
  get 'welcome/index'
  root 'welcome#index'

  # Projects / test cases
  resources :projects do
    resources :t_cases, param: :t_case_id, only: :destroy
    resources :t_cases, param: :id, except: :destroy
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
