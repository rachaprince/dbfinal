class InternshipCommitteesController < ApplicationController
  before_action :set_internship_committee, only: [:show, :edit, :update, :destroy]

  # GET /internship_committees
  # GET /internship_committees.json
  def index
    @internship_committees = InternshipCommittee.all
  end

  # GET /internship_committees/1
  # GET /internship_committees/1.json
  def show
  end

  # GET /internship_committees/new
  def new
    @internship_committee = InternshipCommittee.new
  end

  # GET /internship_committees/1/edit
  def edit
  end

  # POST /internship_committees
  # POST /internship_committees.json
  def create
    @internship_committee = InternshipCommittee.new(internship_committee_params)

    respond_to do |format|
      if @internship_committee.save
        format.html { redirect_to @internship_committee, notice: 'Internship committee was successfully created.' }
        format.json { render :show, status: :created, location: @internship_committee }
      else
        format.html { render :new }
        format.json { render json: @internship_committee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internship_committees/1
  # PATCH/PUT /internship_committees/1.json
  def update
    respond_to do |format|
      if @internship_committee.update(internship_committee_params)
        format.html { redirect_to @internship_committee, notice: 'Internship committee was successfully updated.' }
        format.json { render :show, status: :ok, location: @internship_committee }
      else
        format.html { render :edit }
        format.json { render json: @internship_committee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internship_committees/1
  # DELETE /internship_committees/1.json
  def destroy
    @internship_committee.destroy
    respond_to do |format|
      format.html { redirect_to internship_committees_url, notice: 'Internship committee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internship_committee
      @internship_committee = InternshipCommittee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internship_committee_params
      params.require(:internship_committee).permit(:internship_id, :home_c_id, :away_c_id)
    end
end
