PersonalReference.delete_all
Requisition.delete_all
Profile.delete_all

profile = Profile.new
profile.first_name = 'Juan'
profile.second_name = 'Paco'
profile.first_last_name = 'De la mar'
profile.second_last_name = 'Jiménez'
profile.birth_date = Date.new(1994, 5, 21)
profile.curp = ""
profile.rfc = ""
profile.gender = "male"
profile.birth_state = "DF"
profile.phone_number = "5553525002"

profile.save!(validate: false)
