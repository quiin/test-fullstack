class Requisition < ActiveRecord::Base	
	belongs_to :profile
	has_many :personal_references, dependent: :destroy
	accepts_nested_attributes_for :personal_references,  allow_destroy: true
	validates :income, presence: true
	validates :address_years, presence: true
	validates :dependents_number, presence: true
	validates :company_years, presence: true
	validates :company_name, presence: true
	validates :company_phone_number, presence: true
	validates :company_position, presence: true
	validates :requested_amount, presence: true
	validates :bank	, presence: true
	validate :require_minimum_references
	validate :profile_completed
	monetize :income_cents, as: :income, allow_nil: true, numericality:{greater_than: 0}
	monetize :requested_amount_cents, as: :requested_amount, allow_nil: true, numericality:{greater_than: 0}

	MIN_REFERENCES = 3

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

	def income
		income_cents? ? income_cents.to_money : nil
	end

	def requested_amount
		requested_amount_cents? ? requested_amount_cents.to_money : nil
	end

	private
		def require_minimum_references						
			if personal_references.size < MIN_REFERENCES
				errors.add(:base, "Se requiere un mínimo de 3 referencias") 
			end
		end

		def profile_completed
			if profile.nil? or !profile.is_complete?
				errors.add(:base, "Es necesario compeltar tu perfil") 
			end			
		end

end
