PersonalReference.delete_all
Requisition.delete_all
Profile.delete_all

profile = Profile.new
profile.first_name = 'Juan'
profile.second_name = 'Paco'
profile.first_last_name = 'De la mar'
profile.second_last_name = 'Jiménez'
profile.birth_date = Date.new(1994, 5, 21)
profile.curp = "BADD110313HCMLNS09"
profile.rfc = "CUPU800825569"
profile.gender = "male"
profile.birth_state = Profile::STATES.sample
profile.phone_number = "5512345678"
profile.email = "admin@admin.com"
profile.password = "password"

profile.save!(validate: false)
