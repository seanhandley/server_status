ServerStatus::Application.routes.draw do
  resources :sessions
  resources :events
  resources :updates
  root :to => "events#index"
  match '/feed' => 'events#feed',
        :as => :feed,
        :defaults => { :format => 'atom' }
end
