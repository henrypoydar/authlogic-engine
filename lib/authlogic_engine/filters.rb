module AuthlogicEngine
  module Filters
    
    def ensure_user_is_authenticated
      return true if current_user
      flash[:error] = 'Sorry, you need to be logged in to do that'
      redirect_to login_path
    end
    
  end
end