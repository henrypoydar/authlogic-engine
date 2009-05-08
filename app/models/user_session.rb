class UserSession < Authlogic::Session::Base
  consecutive_failed_logins_limit 10
  
end