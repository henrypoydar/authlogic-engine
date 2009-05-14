class UserNotifier < ActionMailer::Base
  default_url_options[:host] = "#{`hostname`.chomp}"
  
  
  def password_reset_instructions(user)
    subject       "Password reset instructions"
    from          "<system@#{`hostname`.chomp}>"
    recipients    user.email
    sent_on       Time.now
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
  end  

end