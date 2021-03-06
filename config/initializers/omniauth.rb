Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV["YTP_FACEBOOK_ID"], ENV["YTP_FACEBOOK_SECRET"],
  scope: 'email,public_profile', 
  image_size: {width: 400, height: 400},
  display: 'popup', 
  info_fields: 'email,birthday,age_range,gender,first_name,middle_name,last_name'
end