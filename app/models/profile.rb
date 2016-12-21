class Profile < ActiveRecord::Base
  has_secure_password
  has_many :requisitions, dependent: :destroy
  validates :first_name, presence: true, length: {minimum: 3}
  validates :first_last_name, presence: true, length: {minimum: 3}
  validates :second_last_name, presence: true, length: {minimum: 3}
  validates :gender, presence: true, if: :gender_changed?  
  validates :phone_number, length: {minimum: 6}, if: :phone_number?
  # validates :phone_number, presence: true
  validates :rfc, format: { with: /\A[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9]([A-Z0-9]{3})?\z/i, message: :invalid_rfc },  if: :rfc_verify?
  validates :curp, format: { with: /\A[A-Z][AEIOUX][A-Z]{2}[0-9]{2}[0-1][0-9][0-3][0-9][MH][A-Z][BCDFGHJKLMNÑPQRSTVWXYZ]{4}[0-9A-Z][0-9]\z/, message: :invalid_curp }, if: :curp_verify?
  before_save :set_defaults

  STATES = ["Aguascalientes", "Baja California", "Baja California Sur", "Campeche", 
    "Chiapas", "Chihuahua", "Coahuila", "Colima", "Distrito Federal", "Durango", 
    "Estado de México", "Guanajuato", "Guerrero", "Hidalgo", "Jalisco", "Michoacán", 
    "Morelos", "Nayarit", "Nuevo León", "Oaxaca", "Puebla", "Querétaro", 
    "Quintana Roo", "San Luis Potosí", "Sinaloa", "Sonora", "Tabasco", 
    "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatán", "Zacatecas", "Extranjero"]

  DEFAULT_URL = "https://www.kirkleescollege.ac.uk/wp-content/uploads/2015/09/default-avatar.png"

  #Called on oauth login/registration
  def self.from_omniauth(auth)		       
    provider = auth.provider
		uid = auth.uid        
    profile = where(provider: provider, uid: uid).first_or_initialize    
    #Set auth fields
    profile.provider = auth.provider
    profile.uid = auth.uid      
    profile.oauth_token = auth.credentials.token
    profile.oauth_expires_at = Time.at(auth.credentials.expires_at)    
    #Set model fields
    profile.first_name = auth.extra.raw_info.first_name
    profile.second_name = auth.extra.raw_info.middle_name
    profile.first_last_name = auth.extra.raw_info.last_name      
    profile.birth_date = Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y') if auth.extra.raw_info.birthday
    profile.gender = auth.extra.raw_info.gender
    profile.email = auth.extra.raw_info.email
    profile.avatar_url = auth.info.image
    profile.password = "kek"
    profile.save!(validate: false)
    ap profile
    profile
  end

  def full_name
    "#{first_name} #{second_name} #{first_last_name} #{second_last_name}"
  end

  def is_complete?
    first_name? and    
    first_last_name? and
    second_last_name? and
    email? and
    birth_date? and
    curp? and
    rfc? and
    gender? and
    birth_state? and
    phone_number?
  end

  def set_defaults
    self.avatar_url ||= Profile::DEFAULT_URL    
  end

  def rfc_verify?
    rfc.nil? ? false : !rfc.empty?
  end

  #Returns true if curp has empty string
  def curp_verify?
     curp.nil? ? false : !curp.empty?
  end
  

end
