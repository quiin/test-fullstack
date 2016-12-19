class Requisition < ActiveRecord::Base	
	belongs_to :profile
	has_many :personal_references

	validates :income ,:address_years ,:dependents_number, :company_years, :company_name, :company_phone_number, :company_position, :requested_amount, :bank, presence: true

	monetize :income_cents, as: :income, allow_nil: true, numericality:{greater_than: 0}
	monetize :requested_amount_cents, as: :requested_amount, allow_nil: true, numericality:{greater_than: 0}


	MARITAL_STATES = %w(
		Hijo/a
		Padre/a
		Soltero/a
		Casado/a
		Viudo/a
		Divorciado/a
	)

	TERMS = %w(Mensual Semanal Bimestral)

	def income=(value)				
		self[:income_cents] = value.to_money
	end

	def requested_amount=(value)
		self[:requested_amount_cents] = value.to_money
	end

end
