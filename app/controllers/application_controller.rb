class ApplicationController < ActionController::Base  
  protect_from_forgery with: :exception  

  helper_method :current_profile, :logged_in?

  protected

  def current_profile
  	@current_profile ||= Profile.find(session[:profile_id]) if logged_in?
  end 

  def logged_in?
  	session[:profile_id]
  end

end
