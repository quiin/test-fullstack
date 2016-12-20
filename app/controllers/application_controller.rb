class ApplicationController < ActionController::Base  
  protect_from_forgery with: :null_session
  before_action :ensure_login

  helper_method :current_profile, :logged_in?

  protected

  def current_profile
  	@current_profile ||= Profile.find(session[:profile_id]) if logged_in?
  end 

  def logged_in?
  	session[:profile_id]
  end

  def ensure_login
  	unless logged_in?
  		flash[:error] = "Debes iniciar sesión para continuar"
  		redirect_to signin_path 
  	end
  end

end
