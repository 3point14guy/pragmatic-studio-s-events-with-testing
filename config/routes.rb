Rails.application.routes.draw do
  get "signup" => 'user#new'
  resources :users
  root "events#index"
  # took generated resources for registrations and nested them in a block for events
  # this will allow us to navigate to (for example) URLs with /events/:event_id/registrations
  resources :events do
    resources :registrations
  end
  # get "events" => "events#index"
  # get "events/new" => "events#new"
  # get "events/:id" => "events#show", as: "event"
  # get "events/:id/edit" => "events#edit", as: "edit_event"
  # patch "events/:id" => "events#update"

end
