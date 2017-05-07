class ApplicationController < ActionController::Base
  protect_from_forgery
	helper_method :current_user

	

	private

# A problem may arise if a user's session id persists after their User
# account has been deleted due to dropping Users table. To fix the issue, reset
# their session id to nil but this might not be the place to do it.
# If the problem isn't resolved, these conditionals might be able to compensate:
# if session[:user_id]												Checks if session id isn't nil
#		if !User.where(id: session[:user_id]).empty?  Checks if User id matching session id exists

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

end
