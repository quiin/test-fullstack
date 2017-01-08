require 'rails_helper'


describe PersonalReference do
	context 'Model' do
				
		before :context do
			@personal_reference = FactoryGirl.build(:personal_reference)
		end

		it "Requisition class created" do
			expect(class_exists?("Requisition"))
			expect(PersonalReference < ActiveRecord::Base).to eq(true)
		end

		it 'Has a valid associated requisition' do
			expect(@personal_reference.requisition).to be_valid
		end

		context 'Has right class properties' do
			subject(:personal_reference) {@personal_reference}
			it { is_expected.to respond_to (:first_name) }
			it { is_expected.to respond_to (:second_name) }
			it { is_expected.to respond_to (:first_last_name) }
			it { is_expected.to respond_to (:second_last_name) }
			it { is_expected.to respond_to (:cell_phone_number) }
		end

		it 'Has right database structure' do
			expect(PersonalReference.column_types["first_name"].type).to eq :string
			expect(PersonalReference.column_types["second_name"].type).to eq :string
			expect(PersonalReference.column_types["first_last_name"].type).to eq :string
			expect(PersonalReference.column_types["second_last_name"].type).to eq :string
			expect(PersonalReference.column_types["cell_phone_number"].type).to eq :string
		end

		it 'Has a belongs_to relationship with Requisition' do
			expect(PersonalReference.reflect_on_association(:requisition).macro).to eq :belongs_to
		end

		context 'Validations' do
			
			context 'Presence' do
				it 'Does not allow empty first_name field' do
					temp = @personal_reference.dup
					temp.first_name = nil
					expect(temp).to_not be_valid
					expect(@personal_reference).to be_valid	
				end

				it 'Does not allow empty first_last_name field' do
					temp = @personal_reference.dup
					temp.first_last_name = nil
					expect(temp).to_not be_valid
					expect(@personal_reference).to be_valid	
				end

				it 'Does not allow empty second_last_name field' do
					temp = @personal_reference.dup
					temp.second_last_name = nil
					expect(temp).to_not be_valid
					expect(@personal_reference).to be_valid	
				end

				it 'Does not allow empty cell_phone_number field' do
					temp = @personal_reference.dup
					temp.cell_phone_number = nil
					expect(temp).to_not be_valid
					expect(@personal_reference).to be_valid	
				end
			end

			context 'Minimum Length' do
			it 'Doesn not allow first_name field with length smaller than 3' do
				temp = @personal_reference.dup
				temp.first_name = "Mr"
				expect(temp).to_not be_valid
				expect(@personal_reference).to be_valid		
			end

			it 'Doesn not allow first_last_name field with length smaller than 3' do
				temp = @personal_reference.dup
				temp.first_last_name = "Mr"
				expect(temp).to_not be_valid
				expect(@personal_reference).to be_valid		
			end

			it 'Doesn not allow second_last_name field with length smaller than 3' do
				temp = @personal_reference.dup
				temp.second_last_name = "Mr"
				expect(temp).to_not be_valid
				expect(@personal_reference).to be_valid		
			end

			end

		end

	end
end