class AwayRatingsController < ApplicationController
  before_action :set_away_rating, only: [:show, :edit, :update, :destroy]

  # GET /away_ratings
  # GET /away_ratings.json
  def index
    @away_ratings = AwayRating.all
  end

  # GET /away_ratings/1
  # GET /away_ratings/1.json
  def show
  end

  # GET /away_ratings/new
  def new
    @away_rating = AwayRating.new
  end

  # GET /away_ratings/1/edit
  def edit
  end

  # POST /away_ratings
  # POST /away_ratings.json
  def create
    @away_rating = AwayRating.new(away_rating_params)

    respond_to do |format|
      if @away_rating.save
        format.html { redirect_to @away_rating, notice: 'Away rating was successfully created.' }
        format.json { render :show, status: :created, location: @away_rating }
      else
        format.html { render :new }
        format.json { render json: @away_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /away_ratings/1
  # PATCH/PUT /away_ratings/1.json
  def update
    respond_to do |format|
      if @away_rating.update(away_rating_params)
        format.html { redirect_to @away_rating, notice: 'Away rating was successfully updated.' }
        format.json { render :show, status: :ok, location: @away_rating }
      else
        format.html { render :edit }
        format.json { render json: @away_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /away_ratings/1
  # DELETE /away_ratings/1.json
  def destroy
    @away_rating.destroy
    respond_to do |format|
      format.html { redirect_to away_ratings_url, notice: 'Away rating was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_away_rating
      @away_rating = AwayRating.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def away_rating_params
      params.require(:away_rating).permit(:internship_id, :committee_id, :visa, :rating, :explanation, :experience_difficulties)
    end
end
