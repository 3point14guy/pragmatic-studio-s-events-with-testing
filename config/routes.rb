Rails.application.routes.draw do
  get "signup" => 'users#new'
  resources :users
  # note that these are singular - this will remove the id portion of the routes bc each user will only have one session resource.  Rails calls this a singular resource
  # be careful: the routes use the singular version of session, but the controller will use the plural form: sessions_controller.rb
  resource :session
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
