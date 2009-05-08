module AuthlogicEngine
  
  mattr_accessor :login_destination
  self.login_destination = '/'
  
  mattr_accessor :logout_destination
  self.logout_destination = '/'
  
  mattr_accessor :signup_destination
  self.signup_destination = '/'
  
end
