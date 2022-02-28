class TestresultsController < ApplicationController
  before_action :set_testresult, only: %i[ show edit update destroy ]

  # GET /testresults or /testresults.json
  def index
    @testresults = Testresult.all
    authorize @testresult
  end

  # GET /testresults/1 or /testresults/1.json
  def show
  end

  # GET /testresults/new
  def new
    @pid =  params[:patient]
    @testresult = Testresult.new
    authorize @testresult
  end

  # GET /testresults/1/edit
  def edit
  end

  # POST /testresults or /testresults.json
  def create
    @testresult = Testresult.new
    authorize @testresult
    
    if params[:testresult][:recovered] == "1"
      @patientDetails = Patient.find_by(id:params[:testresult][:pid])
      @patientDetails.update(has_recovered:1, to_date: Date.today.to_s)
    end
    @testresult = Testresult.new(testresult_params)
    if @testresult.save
      redirect_to "/patients", notice: "Testresult was successfully added."
      # format.html { redirect_to "/patient", notice: "Testresult was successfully created." }
      # format.json { render :show, status: :created, location: @testresult }
    else
      format.html { render :new, status: :unprocessable_entity }
      format.json { render json: @testresult.errors, status: :unprocessable_entity }
    end
  end

  # PATCH/PUT /testresults/1 or /testresults/1.json
  def update
    @testresult = Testresult.new
    authorize @testresult

    respond_to do |format|
      if @testresult.update(testresult_params)
        format.html { redirect_to testresult_url(@testresult), notice: "Testresult was successfully updated." }
        format.json { render :show, status: :ok, location: @testresult }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @testresult.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testresults/1 or /testresults/1.json
  def destroy
    authorize @testresult
    @testresult.destroy
    respond_to do |format|
      # format.html { redirect_to testresults_url, notice: "Testresult was successfully destroyed." }
      # format.json { head :no_content }
      format.html { redirect_to "/patients", notice: "Test result has been successflly remved" }   
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testresult
      @testresult = Testresult.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def testresult_params
      params.require(:testresult).permit(:pid, :testdate, :test_result, :recovered)
    end
end
