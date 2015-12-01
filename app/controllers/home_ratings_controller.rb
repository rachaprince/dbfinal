class HomeRatingsController < ApplicationController
  before_action :set_home_rating, only: [:show, :edit, :update, :destroy]

  # GET /home_ratings
  # GET /home_ratings.json
  def index
    @home_ratings = HomeRating.all
  end

  # GET /home_ratings/1
  # GET /home_ratings/1.json
  def show
  end

  # GET /home_ratings/new
  def new
    @home_rating = HomeRating.new
  end

  # GET /home_ratings/1/edit
  def edit
  end

  # POST /home_ratings
  # POST /home_ratings.json
  def create
    @home_rating = HomeRating.new(home_rating_params)

    respond_to do |format|
      if @home_rating.save
        format.html { redirect_to @home_rating, notice: 'Home rating was successfully created.' }
        format.json { render :show, status: :created, location: @home_rating }
      else
        format.html { render :new }
        format.json { render json: @home_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_ratings/1
  # PATCH/PUT /home_ratings/1.json
  def update
    respond_to do |format|
      if @home_rating.update(home_rating_params)
        format.html { redirect_to @home_rating, notice: 'Home rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @home_rating }
      else
        format.html { render :edit }
        format.json { render json: @home_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_ratings/1
  # DELETE /home_ratings/1.json
  def destroy
    @home_rating.destroy
    respond_to do |format|
      format.html { redirect_to home_ratings_url, notice: 'Home rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_rating
      @home_rating = HomeRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_rating_params
      params.require(:home_rating).permit(:participant_id, :committee_id, :rating, :explanation, :prep_rating, :prep_explanation, :prior_difficulties)
    end
end
