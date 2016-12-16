class Profile < ActiveRecord::Base
  has_many :requisitions
  has_many :personal_references

	def self.from_omniauth(auth)		    
		provider = auth.provider
		uid = auth.uid
    ap auth
    where(provider: provider, uid: uid).first_or_create do |profile|
      #Set auth fields
      profile.provider = auth.provider
      profile.uid = auth.uid      
      profile.oauth_token = auth.credentials.token
      profile.oauth_expires_at = Time.at(auth.credentials.expires_at)

      #Set model fields
      profile.first_name ||= auth.extra.raw_info.first_name
      profile.second_name ||= auth.extra.raw_info.middle_name
      profile.first_last_name ||= auth.extra.raw_info.last_name      
      profile.birth_date ||= Date.strptime(auth.extra.raw_info.birthday, '%m/%d/%Y') if auth.extra.raw_info.birthday
      profile.gender ||= auth.extra.raw_info.gender      
      profile.birth_state ||= auth.extra.raw_info.hometown.name  if auth.extra.raw_info.hometown        
      profile.save!
    end
  end  

end
