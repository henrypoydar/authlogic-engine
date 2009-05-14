require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PasswordResetsController do
  
  before :each do
    @user = mock_model(User, :id => 36)
    User.stub!(:find).and_return(@user)
  end
  
  describe "routing" do
    include ActionController::UrlWriter
    
    it 'should route to new' do
      action = {:controller => 'password_resets', :action => 'new'}
      route_for(action).should == new_password_reset_path
      params_from(:get, new_password_reset_path).should == action
    end
    
    it 'should route to create' do
      action = {:controller => 'password_resets', :action => 'create'}
      route_for(action).should == {:path => password_resets_path, :method => :post}
      params_from(:post, password_resets_path).should == action
    end

    it 'should route to edit' do
      action = {:controller => 'password_resets', :action => 'edit', :id => '1'}
      route_for(action).should == edit_password_reset_path(1)
      params_from(:get, edit_password_reset_path(1)).should == action
    end
    
    it 'should route to update' do
      action = {:controller => 'password_resets', :action => 'update', :id => '1'}
      route_for(action).should == {:path => password_reset_path(1), :method => :put}
      params_from(:put, password_reset_path(1)).should == action
    end
    
  end
  
  describe '#new' do
    
    before :each do
      get(:new)
    end
    
    it 'should render the new template' do
      response.should render_template('new')
    end
    
  end
 
  describe '#create' do
    
    def do_create
      post(:create, {})
    end
    
    describe 'on success' do
      
      before :each do
        User.stub!(:find_by_email).and_return(@user = mock_model(User, :deliver_password_reset_instructions! => true, :email => 'd@j.com'))
      end

      it 'should display a flash notice' do
        do_create
        flash[:success].should_not be_nil
      end

      it 'should redirect to the root_url' do
        do_create
        assigns[:user].should == @user
        response.should redirect_to(root_url)
      end
      
    end
    
    describe 'on failure' do
      
      before :each do
        User.stub!(:find_by_email).and_return(false)
      end

      it 'should not display flash error notice' do
        do_create
        flash[:error].should_not be_nil
      end

      it 'should assign render the new action' do
        do_create
        response.should render_template('new')
      end
      
    end
    
  end
  
  describe "#edit" do
    
    before :each do
      get(:edit, :id => :current)
    end
    
    it "should render the edit template" do
      assigns[:user] = UserSim.user
      response.should render_template('edit')
    end
    
  end
 
  describe "#update" do


    describe 'on success' do
    
      it 'should display a flash notice' do
      end

      it 'should redirect to the profile_path' do
      end
    
    end
    
    describe 'on failure' do
            
      it 'should display a flash notice' do
      end

      it 'should render the edit template' do
      end

    end
    
  end

 
end