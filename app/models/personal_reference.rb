class PersonalReference < ActiveRecord::Base
	belongs_to :requisition
	validates :first_name, presence: true, length: {minimum: 3}	
	validates :first_last_name, presence: true, length: {minimum: 3}
	validates :second_last_name, presence: true, length: {minimum: 3}
	validates :cell_phone_number	, presence: true
end
