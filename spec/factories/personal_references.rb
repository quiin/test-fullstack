FactoryGirl.define do	

  factory :personal_reference do
		first_name {Faker::Name.first_name}
		second_name {Faker::Name.first_name}
		first_last_name {Faker::Name.last_name}
		second_last_name {Faker::Name.last_name}
		cell_phone_number {Faker::PhoneNumber.cell_phone}	
		association :requisition, factory: :requisition_with_references
			
  end
end