require 'rails_helper'


describe Requisition do
	context 'Requisition model' do
		
		before :example do
			@profile = FactoryGirl.create(:profile)
		end

		before :context do
			@requisition = FactoryGirl.build(:requisition)				
		end

		it "Requisition class created" do
			expect(class_exists?("Requisition"))
			expect(Requisition < ActiveRecord::Base).to eq(true)
		end

		context 'Has right class properties' do
			subject(:requisition) {@requisition}
			it { is_expected.to respond_to (:income) }
			it { is_expected.to respond_to (:address_years) }
			it { is_expected.to respond_to (:marital_status) }
			it { is_expected.to respond_to (:dependents_number) }
			it { is_expected.to respond_to (:has_sgmm) }
			it { is_expected.to respond_to (:has_imss) }
			it { is_expected.to respond_to (:has_car) }
			it { is_expected.to respond_to (:company_years) }
			it { is_expected.to respond_to (:company_name) }
			it { is_expected.to respond_to (:company_phone_number) }
			it { is_expected.to respond_to (:company_position) }
			it { is_expected.to respond_to (:requested_amount) }
			it { is_expected.to respond_to (:payment_terms) }
			it { is_expected.to respond_to (:bank) }
			it { is_expected.to respond_to (:comment) }			
		end

		it 'Has right database structure' do
			expect(Requisition.column_types["income_cents"].type).to eq :integer
			expect(Requisition.column_types["address_years"].type).to eq :integer
			expect(Requisition.column_types["marital_status"].type).to eq :string
			expect(Requisition.column_types["dependents_number"].type).to eq :string
			expect(Requisition.column_types["has_sgmm"].type).to eq :boolean
			expect(Requisition.column_types["has_imss"].type).to eq :boolean
			expect(Requisition.column_types["has_car"].type).to eq :boolean
			expect(Requisition.column_types["company_years"].type).to eq :integer
			expect(Requisition.column_types["company_name"].type).to eq :string
			expect(Requisition.column_types["company_phone_number"].type).to eq :string
			expect(Requisition.column_types["company_position"].type).to eq :string
			expect(Requisition.column_types["requested_amount_cents"].type).to eq :integer
			expect(Requisition.column_types["payment_terms"].type).to eq :string
			expect(Requisition.column_types["bank"].type).to eq :string
			expect(Requisition.column_types["comment"].type).to eq :text
		end

		it "Has a has_many relationship with PersonalReferences" do
  		expect(Requisition.reflect_on_association(:personal_references).macro).to eq :has_many	
  	end

  	it "Has a belongs_to relationship with Profile" do
  		expect(Requisition.reflect_on_association(:profile).macro).to eq :belongs_to	
  	end

  	context 'Validations' do
  		
  		it 'Require MIN_REFERENCES so a Requisition may be created' do
  			expect(@requisition).to be_invalid
  			3.times {@requisition.personal_references << FactoryGirl.create(:personal_reference)}
  			expect(@requisition).to be_valid
  		end

			context 'Presence validations' do							

				it 'Does not allow a Requisition without a income' do										
					temp = @requisition.dup
					temp.income = nil
					expect(temp).to_not be_valid
					expect(@requisition).to be_valid
				end

				it 'Does not allow a Requisition without a address_years' do
					temp = @requisition.dup
					temp.address_years = nil
					expect(temp).to_not be_valid
					expect(@requisition).to be_valid
				end

				it 'Does not allow a Requisition without a dependents_number' do
					temp = @requisition.dup
					temp.dependents_number = nil
					expect(temp).to_not be_valid
					expect(@requisition).to be_valid
				end

				it 'Does not allow a Requisition without a company_years' do
					temp = @requisition.dup
					temp.company_years = nil
					expect(temp).to_not be_valid
					expect(@requisition).to be_valid
				end

				it 'Does not allow a Requisition without a company_name' do
					temp = @requisition.dup
					temp.company_name = nil
					expect(temp).to_not be_valid
					expect(@requisition).to be_valid
				end

				it 'Does not allow a Requisition without a company_phone_number' do
					temp = @requisition.dup
					temp.company_phone_number = nil
					expect(temp).to_not be_valid
					expect(@requisition).to be_valid
				end

				it 'Does not allow a Requisition without a company_position' do
					temp = @requisition.dup
					temp.company_position = nil
					expect(temp).to_not be_valid
					expect(@requisition).to be_valid
				end

				it 'Does not allow a Requisition without a requested_amount' do
					temp = @requisition.dup
					temp.requested_amount = nil
					expect(temp).to_not be_valid
					expect(@requisition).to be_valid
				end

				it 'Does not allow a Requisition without a bank' do
					temp = @requisition.dup
					temp.bank = nil
					expect(temp).to_not be_valid
					expect(@requisition).to be_valid
				end
			end

			context 'Numericality validations' do
				
				it 'Does not allow an income value lesser than 0' do
					@requisition.income = -120
					expect(@requisition).to be_invalid
					@requisition.income = 0
					expect(@requisition).to be_invalid
					@requisition.income = rand(1..1_000_000)
					expect(@requisition).to be_valid

				end

				it 'Does not allow an requested_amount value lesser than 0' do
					@requisition.requested_amount = -120
					expect(@requisition).to be_invalid
					@requisition.requested_amount = 0
					expect(@requisition).to be_invalid
					@requisition.requested_amount = rand(1..1_000_000)
					expect(@requisition).to be_valid

				end
			end

			it 'Requires a Profile to be completed' do
				@requisition = FactoryGirl.create(:requisition_with_references)
				@requisition.profile.rfc = nil
				expect(@requisition).to be_invalid				
				expect(@requisition.errors.messages[:base]).to include("Es necesario compeltar tu perfil")
				@requisition.profile.rfc = FactoryGirl.build(:profile).rfc
				expect(@requisition).to be_valid
			end

  	end

	end
end