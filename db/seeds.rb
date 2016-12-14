PersonalReference.delete_all
Requisition.delete_all
Profile.delete_all

Profile.create!(
	first_name: 'Juan',
	second_name: 'Paco',
	first_last_name: 'De la mar',
	second_last_name: 'Jiménez',
	birth_date: Date.new(1994, 5, 21),
	curp: "ascwecscascewcvwuetvv",
	rfc: "asciuewbicuabslcbecyisbd",
	gender: "H",
	birth_state: "Ciudad de México",
	phone_number: "5554559285"
)