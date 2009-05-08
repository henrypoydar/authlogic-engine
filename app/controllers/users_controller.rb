class UsersController < ApplicationController
  
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
      redirect_to root_url
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
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
  
end
