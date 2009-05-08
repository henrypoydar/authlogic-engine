ActionController::Routing::Routes.draw do |map|

  map.resources :users
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.profile 'profile', :controller => 'users', :action => 'show'

  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  
end