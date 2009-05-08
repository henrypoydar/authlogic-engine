require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSessionsController do
  
  describe "routing" do
    include ActionController::UrlWriter
    
    it 'should route GET /login to new' do
      params_from(:get, '/login')[:action].should == 'new'
    end

    it 'should route DELETE /logout to destroy' do
      params_from(:delete, '/logout')[:action].should == 'destroy'
    end

    it 'should route to create' do
      action = {:controller => 'user_sessions', :action => 'create'}
      route_for(action).should == {:path => user_sessions_path, :method => :post}
      params_from(:post, user_sessions_path).should == action
    end

  end
 
  describe "#new" do
    
    it "should create a new UserSession object" do
      get(:new)
      assigns[:user_session].is_a?(UserSession).should be_true
    end
    
  end
  
  describe '#create' do
    
    describe 'on success' do
      
      it "should login the user and redirect to AuthlogicEngine.login_destination target" do
        UserSession.stub!(:new).and_return(mock_model(UserSession, :save => true))
        post(:create, :username => 'foo', :password => 'bar')
        flash[:success].should_not be_nil
        response.should redirect_to(AuthlogicEngine.logout_destination)
      end
      
    end
    
    describe 'on failure' do
      
      it "should redirect the use to the login form" do
        UserSession.stub!(:new).and_return(mock_model(UserSession, :save => false))
        post(:create, :username => 'foo', :password => 'bar')
        flash[:success].should be_nil
        response.should render_template('new')
      end
      
    end
    
  end
  
  describe "#destroy" do
    
    it "should log out the user and redirect to AuthlogicEngine.logout_destination target" do
      UserSession.stub!(:find).and_return(mock_model(UserSession, :destroy => true))
      delete(:destroy)
      flash[:success].should_not be_nil
      response.should redirect_to(AuthlogicEngine.logout_destination)
    end
    
  end
 
end