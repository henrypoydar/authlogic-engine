class UsersController < ApplicationController
  
  before_filter :ensure_user_is_authenticated, :only => [:show, :edit]
  
  def new
    @user = User.new
  end
  
  def show
    @user = current_user
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Registration successful"
      redirect_to AuthlogicEngine.signup_destination
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:success] = "Successfully updated profile"
      redirect_to :action => 'show'
    else
      render :action => 'edit'
    end
  end
  
end
