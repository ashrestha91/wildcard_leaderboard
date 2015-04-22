class Player
  include Mongoid::Document

  field :name

  field :ping_pong_elo, default: 1450
  field :cornhole_elo, default: 1450

  field :ping_pong_wins, default: 0
  field :cornhole_wins, default: 0

  field :ping_pong_losses, default: 0
  field :cornhole_losses, default: 0

  def add_win(type)
    if type == "ping_pong"
      inc(ping_pong_wins: 1)
    elsif type == "cornhole"
      inc(cornhole_wins: 1)
    end
  end

  def add_loss(type)
    if type == "ping_pong"
      inc(ping_pong_losses: 1)
    elsif type == "cornhole"
      inc(cornhole_losses: 1)
    end
  end

  belongs_to :match
end
