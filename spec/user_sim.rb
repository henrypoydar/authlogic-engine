require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module UserSim
  extend self
  
  def valid_user_attributes 
    {
      :username => 'dick',
      :email => 'dick@johnson.com',
      :password => 'alphabravo',
      :password_confirmation => 'alphabravo'
    }
  end
  
  def user
    User.create!(valid_user_attributes)
  end
  
end
