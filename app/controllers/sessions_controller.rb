class SessionsController < ApplicationController

	def create
		profile = Profile.from_omniauth(env["omniauth.auth"])		
		session[:profile_id] = profile.id
		redirect_to root_path
	end

	def destroy
		session[:profile_id] = nil
		redirect_to root_path
	end

	def index
		
	end

end
