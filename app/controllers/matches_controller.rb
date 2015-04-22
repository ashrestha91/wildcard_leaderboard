class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @match = Match.new
    @players = Player.all
  end

  def create
    @match = Match.new(match_params)

    respond_to do |format|
      if @match.save
        format.html { redirect_to leaderboard_path, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      match_params = params.require(:match).permit(:game_type, :winners_score, :losers_score)
      match_params[:winners] = params[:match][:winners].map { |id| Player.find(id) if !id.blank? }
      match_params[:losers] = params[:match][:losers].map { |id| Player.find(id) if !id.blank? }

      return match_params
    end
end
