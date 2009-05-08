module AuthlogicEngine
  
  mattr_accessor :login_destination
  self.login_destination = root_url
  
  mattr_accessor :logout_destination
  self.logout_destination = root_url
  
end
