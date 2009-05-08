require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  
  before :each do
    @valid_attributes = {
      :username => 'dick',
      :email => 'dick@johnson.com',
      :password => 'alphabravo',
      :password_confirmation => 'alphabravo'
    }
  end
  
  describe 'validations' do
    
    it 'should create a new instance given valid attributes' do
      User.create!(@valid_attributes).should be_true
    end
    
  end
  
  describe 'behaviors' do
    
    it 'should acts as authentic (authlogic)' do; end
    
  end
  
end