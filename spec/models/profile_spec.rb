require 'rails_helper'


describe Profile do
  context "Profile model" do

  	before :each do
  		@profile = FactoryGirl.create(:profile)
  	end
  	
  	it "Profile class created" do
  		expect(class_exists?("Profile"))
  		expect(Profile < ActiveRecord::Base).to eq(true)
  	end

  	context "Profile class has right properties" do
  		subject(:profile) {Profile.new}
  		it { is_expected.to respond_to (:first_name) }
			it { is_expected.to respond_to (:second_name) }
			it { is_expected.to respond_to (:first_last_name) }
			it { is_expected.to respond_to (:second_last_name) }
			it { is_expected.to respond_to (:email) }
			it { is_expected.to respond_to (:birth_date) }
			it { is_expected.to respond_to (:curp) }
			it { is_expected.to respond_to (:rfc) }
			it { is_expected.to respond_to (:gender) }
			it { is_expected.to respond_to (:birth_state) }
			it { is_expected.to respond_to (:phone_number) }
			it { is_expected.to respond_to (:avatar_url) }
			it { is_expected.to respond_to (:password) }
  	end

  	it "Profile database table has right property structure" do  		
			expect(Profile.column_types["first_name"].type).to eq :string
			expect(Profile.column_types["second_name"].type).to eq :string
			expect(Profile.column_types["first_last_name"].type).to eq :string
			expect(Profile.column_types["second_last_name"].type).to eq :string
			expect(Profile.column_types["email"].type).to eq :string
			expect(Profile.column_types["birth_date"].type).to eq :date
			expect(Profile.column_types["curp"].type).to eq :string
			expect(Profile.column_types["rfc"].type).to eq :string
			expect(Profile.column_types["gender"].type).to eq :string
			expect(Profile.column_types["birth_state"].type).to eq :string
			expect(Profile.column_types["phone_number"].type).to eq :string
			expect(Profile.column_types["avatar_url"].type).to eq :string
			expect(Profile.column_types["password_digest"].type).to eq :string
  	end

  	it "Profile has a has_many relationship with Requisition" do
  		expect(Profile.reflect_on_association(:requisitions).macro).to eq :has_many	
  	end

  	context "Validations" do
  		
  		context "Presence validations" do	  			  	
  		
  			it "Does not allow a Profile without a first_name" do
  				@profile.first_name = nil
	  			expect(@profile).to_not be_valid
	  		end

	  		it "Does not allow a Profile without first_last_name" do	  			
					@profile.first_last_name = nil	  			
	  			expect(@profile).to_not be_valid
	  		end

	  		it "Does not allow a Profile without second_last_name" do	  			
	  			@profile.second_last_name = nil
	  			expect(@profile).to_not be_valid
	  		end
	  		
	  		it "Does not allow a Profile without an email" do	  			
	  			expect(Profile.new(email: nil)).to_not be_valid
	  		end	

	  		it "Does not allow a Profile without gender" do
					@profile.gender = nil
					expect(@profile).to_not be_valid
				end

				it "Doeas allow creating a Profile without birth_date" do
					@profile.birth_date = nil
					expect(@profile).to be_valid
				end

				it "Doeas allow creating a Profile without curp" do
					@profile.curp = nil
					expect(@profile).to be_valid
				end

				it "Doeas allow creating a Profile without rfc" do
					@profile.rfc = nil
					expect(@profile).to be_valid
				end							

				it "Doeas allow creating a Profile without birth_state" do
					@profile.birth_state = nil
					expect(@profile).to be_valid
				end

				it "Doeas allow creating a Profile without phone_number" do
					@profile.phone_number = nil
					expect(@profile).to be_valid
				end

				it "Doeas allow creating a Profile without avatar_url" do
					@profile.avatar_url = nil
					expect(@profile).to be_valid
				end  	
	  	end

	  	context "Length validations" do
				it "Does not allow a Profile with first_name length smaller than 3" do
					@profile.first_name = "Mr"
					expect(@profile).to_not be_valid	
				end

				it "Does not allow a Profile with first_last_name length smaller than 3" do
					@profile.first_last_name = "Mr"
					expect(@profile).to_not be_valid	
				end

				it "Does not allow a Profile with second_last_name length smaller than 3" do
					@profile.second_last_name = "Mr"
					expect(@profile).to_not be_valid	
				end

				it "Does not allow a Profile with phone_number length smaller than 3" do
					@profile.phone_number = "Mr"
					expect(@profile).to_not be_valid	
				end
	  	end

	  	context "RFC validations" do
				it 'Accepts rfc (completo)' do
				  expect(Profile.new(rfc: 'AAAA111111AAA').errors.added?(:rfc, :invalid_rfc)).to be false
				end

				it 'Accepts rfc (con 3 caracteres para el nombre)' do
				  expect(Profile.new(rfc: 'AAA111111AAA').errors.added?(:rfc, :invalid_rfc)).to be false
				end

				it 'Accepts rfc (sin homoclave)' do
				  expect(Profile.new(rfc: 'AAAA111111').errors.added?(:rfc, :invalid_rfc)).to be false
				end

				it 'Accepts rfc (sin homoclave y con 3 caracteres para el nombre)' do
				  expect(Profile.new(rfc: 'AAA111111').errors.added?(:rfc, :invalid_rfc)).to be false
				end

				it 'Accepts rfc (datos de nombre con Ñ)' do
				  expect(Profile.new(rfc: 'ÑAAA111111AAA').errors.added?(:rfc, :invalid_rfc)).to be false
				end
				
				it 'Does not accept an invalid rfc' do
					@profile.rfc = 'akshbcjwehvbcjw'
					@profile.valid?																	
					expect(@profile).to_not be_valid
				end

				it 'Sets an apropiate error message when an invalid rfc is found' do
					@profile.rfc = '000012kchbwe'
					@profile.valid?
					expect(@profile.errors.messages[:rfc]).to include(I18n.t('activerecord.errors.messages.invalid_rfc'))
				end
	  	end

	  	context "CURP validations" do
				it 'Accepts curp (hombre)' do
	        expect(Profile.new(curp: 'AAAA111111HDFBBB01').errors.added?(:rfc, :invalid_curp)).to be false
	      end

	      it 'Accepts curp (mujer)' do
	        expect(Profile.new(curp: 'AAAA111111MDFBBB01').errors.added?(:rfc, :invalid_curp)).to be false
	      end

	      it 'Accepts curp (digito anti-duplicado alfanumérico)' do
	        expect(Profile.new(curp: 'AAAA111111HDFBBBA1').errors.added?(:rfc, :invalid_curp)).to be false
	      end

	      it 'Rejects curp (nombre con digito en lugar de letra)' do
	      	@profile.curp = '9AAA111111HDFBBB01'
	      	@profile.valid?
	        expect(@profile.errors.messages[:curp].length).to eq(1)
	      end

	      it 'Rejects curp (caracter inválido)' do
	        @profile.curp =  'A*AA111111HDFBBB01'
	        @profile.valid?
	        expect(@profile.errors.messages[:curp].length).to eq(1)
	      end

	      it 'Rejects curp (falta un digito en la fecha)' do
	        @profile.curp =  'AAAA11111HDFBBB01'
	        @profile.valid?
	        expect(@profile.errors.messages[:curp].length).to eq(1)
	      end

	      it 'Rejects curp (falta un caracter en los datos del nombre)' do
	        @profile.curp =  'AAA111111HDFBBB01'
	        @profile.valid?
	        expect(@profile.errors.messages[:curp].length).to eq(1)
	      end

	      it 'Rejects curp (el dia es inválido 42)' do
	        @profile.curp =  'AAAA111142HDFBBB01'
	        @profile.valid?
	        expect(@profile.errors.messages[:curp].length).to eq(1)
	      end

	      it 'Rejects curp (el mes es inválido 25)' do
	        @profile.curp =  'AAAA112511HDFBBB01'
	        @profile.valid?
	        expect(@profile.errors.messages[:curp].length).to eq(1)
	      end

	      it 'Rejects curp (sexo es inválido K)' do
	        @profile.curp =  'AAAA111111KDFBBB01'
	        @profile.valid?
	        expect(@profile.errors.messages[:curp].length).to eq(1)
	      end
								

				it 'Sets an apropiate error message when an invalid curp is found' do
					@profile.curp = 'AAAA112511HDFBBB01'
					@profile.valid?
					expect(@profile.errors.messages[:curp]).to include(I18n.t('activerecord.errors.messages.invalid_curp'))
				end
	  	end

  	end  

  end
end