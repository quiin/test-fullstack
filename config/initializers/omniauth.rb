Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["YTP_FACEBOOK_ID"], ENV["YTP_FACEBOOK_SECRET"],
  scope: 'email,public_profile', display: 'popup'
end