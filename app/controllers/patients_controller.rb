class PatientsController < ApplicationController
  before_action :set_patient, only: %i[ show edit update destroy ]

  # GET /patients or /patients.json
  def index
    @patients = Patient.where(created_by:current_user.id, transfer_to:nil,to_date:nil)  
    @recoveredpatients = Patient.where(created_by:current_user.id, transfer_to:nil).where.not(to_date:nil)    
    authorize @patients
  end

  # GET /patients/1 or /patients/1.json
  def show
    
    @testresult = Testresult.where(pid:params[:id])
    authorize @patient
  end

  # GET /patients/new
  def new
    @patient = Patient.new
    authorize @patient
  end

  # GET /patients/1/edit
  def edit
    patient = Patient.find(params[:id])
    authorize patient
  end

  # POST /patients or /patients.json
  def create
    @patient = Patient.new(patient_params)
    authorize @patient
    respond_to do |format|
      if @patient.save
        format.html { redirect_to patient_url(@patient), notice: "Patient was successfully created." }
        format.json { render :index, status: :created, location: @patient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1 or /patients/1.json
  def update
    patient = Patient.all
    authorize patient
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to patient_url(@patient), notice: "Patient was successfully updated." }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1 or /patients/1.json
  def destroy
    authorize @patient
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: "Patient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def transfer 
    @patient = Patient.new
    authorize @patient
    @patientdetail = Patient.find_by(id:params[:id])
  end

  def transferrequest 
    @patient = Patient.all
    authorize @patient
    transferfrom = Patient.find_by(id:params[:id])
    authorize transferfrom
    transferto = User.where.not(invitation_accepted_at: nil).where(email:params[:transfer_to])

    if transferfrom.present? && transferto.present?
      if transferfrom.update(transfer_from: current_user.id,
                              transfer_to: transferto[0].id, 
                              transfer_date: Date.today.to_s)
        redirect_to "/patient", notice: "Transfer Request Sent." 
      else
        format.html { render :transfer, status: :unprocessable_entity }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    else
      redirect_back fallback_location: root_path, notice: "Email not fount"
    end
  end

  def requesttransfer
    @requesttransfer = Patient.where(transfer_to:current_user.id).where.not(created_by:current_user.id)
    authorize @requesttransfer
    @transferrequestsent = Patient.where(created_by:current_user.id).where.not(transfer_to:nil)
  end

  def requesttransferupdate
    patient = Patient.find_by(id:params[:id])
    authorize patient

    if patient.update(created_by: current_user.id,from_date: Date.today.to_s,to_date:nil, transfer_to: nil)
      redirect_back fallback_location: root_path, notice: "Transfer Request Accepted"
    else
      redirect_back fallback_location: root_path, notice: "error"
    end
  end

  def requesttransfercancle
    patient = Patient.find_by(id:params[:id])
    authorize patient

    if patient.update(transfer_date:nil, transfer_from:nil, transfer_to: nil)
      redirect_back fallback_location: root_path, notice: "Transfer Request Cancled"
    else
      redirect_back fallback_location: root_path, notice: "error"
    end
  end

  private
    # def transfer_fields
    #   params.require(:patient).permit(:created_by, :p_cid, :p_phone, :p_name, :from_date, :to_date)
    # end
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_params
      params.require(:patient).permit(:created_by, :p_cid, :p_phone, :p_name, :from_date, :to_date, :transfer_date, :transfer_from, :transfer_to, :profile)
    end

    def testresult_params
      params.require(:testresult).permit(:pid, :testdate, :test_result, :recovered)
    end
end
