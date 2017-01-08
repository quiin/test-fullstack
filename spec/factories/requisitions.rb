FactoryGirl.define do
	
	optional_comment = rand(1..10).even? ? Faker::Hipster.paragraph : nil

  factory :requisition do
		income {Faker::Number.number(4)}
		address_years {Faker::Number.digit}
		marital_status {Requisition::MARITAL_STATES.sample}
		dependents_number {Faker::Number.digit}
		has_sgmm {Faker::Boolean.boolean} 
		has_imss {Faker::Boolean.boolean}
		has_car {Faker::Boolean.boolean}
		company_years {Faker::Number.digit}
		company_name {Faker::Company.name}
		company_phone_number {Faker::PhoneNumber.cell_phone}
		company_position {Faker::Company.profession}
		requested_amount {Faker::Number.number(10)}
		payment_terms {Requisition::TERMS.sample}
		bank {"Santander"}
		comment {optional_comment}
		association :profile

		factory :requisition_with_references do  	
			transient do				
				after :build do |req|			
					req.personal_references << create_list(:personal_reference, Requisition::MIN_REFERENCES, requisition: req)
				end
			end
		end	

  end

  

end