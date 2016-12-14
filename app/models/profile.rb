class Profile < ActiveRecord::Base
  has_many :requisitions
  has_many :personal_references

	def self.from_omniauth(auth)		
    puts "--------------"
    ap auth
    puts "--------------"
		provider = auth.provider
		uid = auth.uid
    where(auth.slice(provider: provider, uid: uid)).first_or_create do |profile|
      profile.provider = auth.provider
      profile.uid = auth.uid
      profile.username = auth.info.name
      profile.oauth_token = auth.credentials.token
      profile.oauth_expires_at = Time.at(auth.credentials.expires_at)
      profile.save!
    end
  end  

end
