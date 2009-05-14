module AuthlogicEngine
  module Filters
    
    def require_logged_in_user
      return true if current_user
      flash[:error] = 'Sorry, you need to be logged in to do that'
      redirect_to login_path
    end
    
    def require_logged_out_user
      return true unless current_user
      flash[:error] = 'Sorry, you need to be logged out to do that'
      redirect_to profile_path
    end
    
  end
end