ActionController::Routing::Routes.draw do |map|

  map.resources :users, :user_sessions, :password_resets
  
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.profile 'profile', :controller => 'users', :action => 'show'
  
  map.forgotten_password 'forgotten_password', :controller => 'password_resets', :action => 'new'

  map.login 'login', :controller => 'user_sessions', :action => 'new'
  map.logout 'logout', :controller => 'user_sessions', :action => 'destroy'
  
end