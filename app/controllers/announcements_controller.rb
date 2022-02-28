class AnnouncementsController < ApplicationController
  before_action :set_announcement, only: %i[ show edit update destroy ]

  # GET /announcements or /announcements.json
  def index
    announcement = Announcement.new
    authorize announcement
    @announcements = Announcement.all
    
  end

  # GET /announcements/1 or /announcements/1.json
  def show
    @announcements = Announcement.all
  end

  # GET /announcements/new
  def new
    @announcement = Announcement.new
    authorize @announcement
  end

  # GET /announcements/1/edit
  def edit
    announcement = Announcement.new
    authorize announcement
  end

  # POST /announcements or /announcements.json
  def create
    announcement = Announcement.new
    authorize announcement
    @announcement = Announcement.new(announcement_params)

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to announcement_url(@announcement), notice: "Announcement was successfully created." }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1 or /announcements/1.json
  def update
    authorize @announcement
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to announcement_url(@announcement), notice: "Announcement was successfully updated." }
        format.json { render :show, status: :ok, location: @announcement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1 or /announcements/1.json
  def destroy
    authorize @announcement
    @announcement.destroy

    respond_to do |format|
      format.html { redirect_to announcements_url, notice: "Announcement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def announcement_params
      params.require(:announcement).permit(:announcement, :avatar)
    end
end
