FactoryGirl.define do		
  factory :profile do
  	first_name { Faker::Name.first_name }
		second_name { Faker::Name.first_name }
		first_last_name {Faker::Name.last_name}
		second_last_name { Faker::Name.last_name }
		email { Faker::Internet.email }
		birth_date {Faker::Date.between(18.years.ago, Date.today)}
		curp {'AAAA111111HDFBBB01'}
		rfc {'AAAA111111AAA'}
		gender {:male}
		birth_state {Profile::STATES.sample}
		phone_number {Faker::PhoneNumber.cell_phone}
		avatar_url {Faker::Avatar.image}
		password {Faker::Internet.password}
  end
end