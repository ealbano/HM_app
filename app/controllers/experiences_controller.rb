class ExperiencesController < ApplicationController
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  # GET /experiences
  # GET /experiences.json

  def index
    @experiences = current_user.experiences
# raise
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
    @note = Note.new
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
  end

  # POST /experiences
  # POST /experiences.json
  def create
    @experience = Experience.new(experience_params)
    current_user.experiences << @experience
    if @experience.save
      redirect_to @experience, notice: 'Experience was successfully created.' 
    else
      render action: 'new' 
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
      if @experience.update(experience_params)
        redirect_to @experience, notice: 'Experience was successfully updated.'
      else
        render action: 'edit'
      end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    redirect_to experiences_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:title, :content)
    end
end
