class SessionsController < ApplicationController	

	skip_before_action :ensure_login, only: [:new, :create, :destroy, :index]

  # Verifica si el usuario ya inició sesión.
  def new
    if logged_in?
      redirect_to current_profile, notice: "Ya cuentas con una sesión"
    end  	
  end

	def create		
		auth = request.env['omniauth.auth']
		profile = nil
		
		if auth #facebook login 
			profile = Profile.from_omniauth(auth)
		else #form login			
			email = params[:profile][:email]
			profile = Profile.find_by(email: email)
		end

		if profile and (auth or profile.authenticate(params[:profile][:password]))			
			session[:profile_id] = profile.id
			redirect_to profile, notice: "Bienvenido #{profile.first_name}"					
		else
			flash[:error] = 'Credenciales inválidas'
			redirect_to new_session_path 
		end
	end

	def destroy
		reset_session
		redirect_to root_path, notice: 'Sesión terminada'
	end

	def index		
	end

end
