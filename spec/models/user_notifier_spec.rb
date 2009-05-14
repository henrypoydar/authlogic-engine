require File.dirname(__FILE__) + '/../spec_helper'

describe UserNotifier do
  
  before :each do
    ActionMailer::Base.delivery_method = :test  
    ActionMailer::Base.perform_deliveries = true  
    ActionMailer::Base.deliveries = []
    @user = UserSim.user
  end
  
  describe '#password_reset_instructions' do
    
    it "should send an email with a password reset link" do
      mail = UserNotifier.deliver_password_reset_instructions(@user)
      ActionMailer::Base.deliveries.size.should == 1  
      mail.body.should =~ /http/
    end
  
  end
  
  
end