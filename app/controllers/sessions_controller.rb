class SessionsController < ApplicationController

	def create		
		profile = Profile.from_omniauth(request.env['omniauth.auth'])		
		session[:profile_id] = profile.id
		redirect_to root_path
	end

	def destroy
		reset_session
		redirect_to root_path, notice: 'Sesión terminada'
	end

	def index
		
	end

end
