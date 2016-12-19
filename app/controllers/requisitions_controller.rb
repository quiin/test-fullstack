class RequisitionsController < ApplicationController
  before_action :set_profile
  before_action :set_requisition, only: [:show, :edit, :update]


  
  def show    
  end

  # GET /requisitions/new
  def new
    @requisition = flash[:req] ? @profile.requisitions.new(flash[:req]) : @profile.requisitions.new
    @requisition.valid? if flash[:req]
    flash.clear
  end

  # GET /requisitions/1/edit
  def edit
  end

  # POST /requisitions
  # POST /requisitions.json
  def create
    @requisition = @profile.requisitions.new(requisition_params)    
    respond_to do |format|
      if @requisition.save
        format.html { redirect_to @profile, notice: 'Tu solicitid ha sido creada' }
        format.json { render :show, status: :created, location: @requisition }
      else
        format.html do 
          flash[:req] = @requisition
          redirect_to action: :new
          # render :new           
        end
        format.json { render json: @requisition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requisitions/1
  # PATCH/PUT /requisitions/1.json
  def update
    respond_to do |format|
      if @requisition.update(requisition_params)        
        format.html { redirect_to @requisition, notice: 'Tu solicitud fue actualizada' }
        format.json { render :show, status: :ok, location: @requisition }
      else
        format.html { render :edit }
        format.json { render json: @requisition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requisitions/1
  # DELETE /requisitions/1.json
  def destroy
    @requisition.destroy
    respond_to do |format|
      format.html { redirect_to requisitions_url, notice: 'Requisition was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:profile_id])
    end

    def set_requisition
      set_profile unless @profile
      @requisition = @profile.requisitions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requisition_params
      params.require(:requisition).permit(:income, :address_years, :company_years, :marital_status, 
        :requested_amount, :payment_terms, :bank, :comment, 
        :company_name, :company_phone_number, :dependents_number, 
        :company_position, :has_sgmm, :has_imss, :has_car)
    end
end
