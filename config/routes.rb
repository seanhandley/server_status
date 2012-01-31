ServerStatus::Application.routes.draw do
  resources :sessions
  resources :events
  resources :updates
  root :to => "events#index"
end
