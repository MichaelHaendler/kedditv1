

# the book is about views and stuff for some of sessions stuff, and I just don't see it that way. 
# I just see session as a tool to be used by other actions that should have views themselves.  

module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  def successfully_signed_in
  	logger.debug "start of successfully_signed_in--------------------------------------"

  	
  	@user = User.find_by(user_name: params[:session][:user_name])

  	p @user

  	if !@user.nil?
  		p "user found"
  	else
  		p "user NOT found"
  	end

  	p "user name is: #{@user.user_name}"
  	p @user.password == nil ? "user password is nil" : "user password is: #{@user.password}"

  	if !@user.nil? && @user.password == params[:session][:password]
  		p "logging in user"
  		log_in @user
  		return true
  	else
  		p "NOTTT logging in user"
  		return false
  	end
  	
  	logger.debug "END of successfully_signed_in--------------------------------------"
  end

  def log_in(user)
    session[:user_id] = user.id
  end


end