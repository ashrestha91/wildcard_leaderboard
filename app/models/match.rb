class Match
  include Mongoid::Document

  field :game_type

  has_many :winners, class_name: "Player"
  has_many :losers, class_name: "Player"

  field :winners_score, type: Integer, default: 0
  field :losers_score, type: Integer, default: 0

  before_save do
    winners.map { |player| player.add_win(game_type) }
    losers.map { |player| player.add_loss(game_type) }
  end

  # def finish_match
  # end

  # def update_elo!
    # players.each do |player|
      # new_elo = k_factor * (score - (1.to_f / 10^( player.elo_for(game) -  ))
    # end
  # end
end
