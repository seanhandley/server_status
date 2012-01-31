ServerStatus::Application.routes.draw do
  resources :events
  resources :sessions
  root :to => "events#index"
end
