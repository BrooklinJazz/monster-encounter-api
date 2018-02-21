class Api::V1::CombatsController < ApplicationController
  before_action :set_combat, only: [:show, :edit, :update, :destroy]
  # add index to only
  # before_action :set_user, only: [:index]
  skip_before_action :verify_authenticity_token

  # GET /combats
  # GET /combats.json
  def index
    # @user = @combate.user
    @user = User.find(params[:user_id])
    if true
      @combats = @user.combats
      render :json => @combats
    else
      # TODO flash alert notice with errors message
    end
  end

  # GET user/:id/combats/1.json
  def show
    render :json => @combat.fight
  end

  # POST /combats
  # POST /combats.json
  def create
    @combat = Combat.new(combat_params)

    respond_to do |format|
      if @combat.save
        format.html { redirect_to @combat, notice: 'Combat was successfully Saved.' }
        format.json { head :created }
      else
        # binding.pry
        format.html { render :new }
        format.json { render json: @combat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /combats/1
  # PATCH/PUT /combats/1.json
  def update
    respond_to do |format|
      if @combat.update(combat_params)
        format.html { redirect_to @combat, notice: 'Combat was successfully updated.' }
        format.json { render :show, status: :ok, location: @combat }
      else
        format.html { render :edit }
        format.json { render json: @combat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /combats/1
  # DELETE /combats/1.json
  def destroy
    @combat.destroy
    respond_to do |format|
      format.html { redirect_to combats_url, notice: 'Combat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_combat
      @combat = Combat.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def combat_params
      params.require(:combat).permit(:name, :user_id, fight: [:Name, :Source, :Type, :currentHp, :Challenge, :Description, :Player, :InitiativeModifier, :InitiativeRoll, :HP => {}, :AC => {}, :Speed => [], :Abilities => {}, :DamageVulnerabilities => [], :DamageResistances => [], :DamageImmunities => [], :ConditionImmunities => [], :Senses => [], :Languages => [], :Reactions => [], :Saves => [:Name, :Modifier], :Skills => [:Name, :Modifier], :Traits => [:Name, :Content, :Usage], :Actions => [:Name, :Content, :Usage], :LegendaryActions => [:Name, :Content, :Usage]])
      # params.require(:combat).permit(:)
      # params.require(:combat).permit(:name, :user_id, :fight).permit!([:date => {}]) => [:data => {}])
      # params.require(:fight).permit!
    end
end
