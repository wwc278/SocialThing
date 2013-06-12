SocialThing::Application.routes.draw do

  resource :session
  resources :users do
      resources :friend_circle_memberships,
      :path => 'circle',
      :only => ['index', 'create', 'new']
      resources :posts, :only => ["index", "create", "new"]
  end

  resources :friend_circle_memberships, :except => ['index', 'create', 'new']
  resources :posts, :except => ["index", "create", "new"]
end
