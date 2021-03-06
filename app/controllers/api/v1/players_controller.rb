class Api::V1::PlayersController < ApplicationController
  before_action :set_player, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /players
  # GET /players.json
  def index
    @user = User.find(params[:user_id])
    if true
      @players = @user.players
      render :json => @players
    else
      # TODO flash alert notice with errors message
    end
  end

  # POST /players
  # POST /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to @player, notice: 'Player was successfully created.' }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1
  # DELETE /players/1.json
  def destroy
    @player.destroy
    respond_to do |format|
      format.html { redirect_to players_url, notice: 'Player was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_params
      params.require(:player).permit(:user_id, stats: [:Name, :Source, :Type, :currentHp, :Challenge, :Description, :Player, :InitiativeModifier, :HP => {}, :AC => {}, :Speed => [], :Abilities => {}, :DamageVulnerabilities => [], :DamageResistances => [], :DamageImmunities => [], :ConditionImmunities => [], :Senses => [], :Languages => [], :Reactions => [], :Saves => [:Name, :Modifier], :Skills => [:Name, :Modifier], :Traits => [:Name, :Content, :Usage], :Actions => [:Name, :Content, :Usage], :LegendaryActions => [:Name, :Content, :Usage]])
    end
end
