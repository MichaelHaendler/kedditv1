

# the book is about views and stuff for some of sessions stuff, and I just don't see it that way. 
# I just see session as a tool to be used by other actions that should have views themselves.  

#the reason I use params[:session] rather than params[:user] is because :user was used to create/modify
#a user. This however is for creating a new session. could have used :user, but felt like it might be
#misleading to do so.
module SessionsHelper

  def clear_session
    logger.debug "start of clear_session--------------------------------------"

    reset_session

    # session[:id] = nil
    # session[:user_name] = nil

    # session.each do |key,value|
    #   session[key] = nil
    # end

  # request.session.each {|key, value| 
  #   request.session[key] = nil 
  # }

#request.session.each {|key, value| puts key.to_s + " --> " + value.to_s }

    logger.debug "end of clear_session--------------------------------------"
  end

  # Logs in the given user.
  def log_in(user)
    session[:id] = user.id
    session[:user_name] = user.user_name
  end

  def successfully_signed_in
  	logger.debug "start of successfully_signed_in--------------------------------------"

  	
  	@user = User.find_by(user_name: params[:session][:user_name])

  	#p @user

    ##for debugging
  	# if !@user.nil?
  	# 	p "user found"
  	# else
  	# 	p "user NOT found"
  	# end

  	#p "user name is: #{@user.user_name}"
  	#p @user.password == nil ? "user password is nil" : "user password is: #{@user.password}"

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


end