require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
  
  before :each do
    @user = mock_model(User, :id => 36)
    User.stub!(:find).and_return(@user)
  end
  
  describe "routing" do
    include ActionController::UrlWriter
    
    it 'should route to new' do
      action = {:controller => 'users', :action => 'new'}
      route_for(action).should == new_user_path
      params_from(:get, new_user_path).should == action
    end
    
    it 'should route GET /signup to new' do
      params_from(:get, '/signup')[:action].should == 'new'
    end

    it 'should route to create' do
      action = {:controller => 'users', :action => 'create'}
      route_for(action).should == {:path => users_path, :method => :post}
      params_from(:post, users_path).should == action
    end

    it 'should route to edit' do
      action = {:controller => 'users', :action => 'edit', :id => '1'}
      route_for(action).should == edit_user_path(1)
      params_from(:get, edit_user_path(1)).should == action
    end
    
    it 'should route to update' do
      action = {:controller => 'users', :action => 'update', :id => '1'}
      route_for(action).should == {:path => user_path(1), :method => :put}
      params_from(:put, user_path(1)).should == action
    end
    
    it 'should route to show' do
      action = {:controller => 'users', :action => 'show', :id => '1'}
      route_for(action).should == user_path(1)
      params_from(:get, user_path(1)).should == action
    end
    
    it 'should route GET /profile to show' do
      params_from(:get, '/profile')[:action].should == 'show'
    end
    
  end
  

  describe '#new' do
    
    before :each do
      get(:new)
    end
    
    it 'should assign a new user instance variable' do
      assigns[:user].class.should == User
      assigns[:user].should be_new_record
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
        User.stub!(:new).and_return(@user = mock_model(User, :save => true))
      end
      
      it 'should display a flash notice' do
        do_create
        flash[:success].should_not be_nil
      end
      
      it 'should redirect to the AuthlogicEngine.signup_destination target' do
        do_create
        assigns[:user].should == @user
        response.should redirect_to(AuthlogicEngine.signup_destination)
      end
      
    end
    
    describe 'on failure' do
      
      before :each do
        User.stub!(:new).and_return(@user = mock_model(User, :save => false))
      end

      it 'should not display a flash success notice' do
        do_create
        flash[:success].should be_nil
      end

      it 'should assign @user and render the new action' do
        do_create
        assigns[:user].should == @user
        response.should render_template('new')
      end
      
    end
    
  end
  
  describe "#edit" do
    
    before :each do
      controller.stub!(:current_user).and_return(@user)
      get(:edit, :id => 36)
    end

    it "should render the edit template" do
      response.should render_template('edit')
    end

    it "should assign a new @user instance variable" do
      assigns[:user].class.should == User
      assigns[:user].should == @user
    end
    
  end
 
  describe "#update" do
    
    def do_update
      controller.stub!(:current_user).and_return(@user)
      post(:update, :id => @user)
    end

    describe 'on success' do
    
      before :each do
        @user.stub!(:update_attributes).and_return(true)
      end
      
      it 'should display a flash notice' do
        do_update
        flash[:success].should_not be_nil
      end

      it 'should redirect to the show method' do
        do_update
        assigns[:user].should == @user
        response.should redirect_to(:action => 'show')
      end
    
    end
    
    describe 'on failure' do
      
      before :each do
        @user.stub!(:update_attributes).and_return(false)
      end
      
      it 'should not display a flash success notice' do
        do_update
        flash[:success].should be_nil
      end

      it 'should assign @user and render the edit action' do
        do_update
        assigns[:user].should == @user
        response.should render_template('edit')
      end
      
    end
    
  end
  
  describe '#show' do
    
    it "should render the show template" do
      controller.stub!(:current_user).and_return(mock_model(User))
      get(:show)
      flash[:error].should be_nil
      response.should render_template('show')
    end
    
    it "should redirect to login if there is no current user" do
      controller.stub!(:current_user).and_return(nil)
      get(:show)
      flash[:error].should_not be_nil
      response.should redirect_to(login_path)
    end
    
  end
 
 
end