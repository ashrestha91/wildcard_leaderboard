Rails.application.routes.draw do
  root to: 'players#leaderboard'
  resources :matches
  resources :matches, only: [:new, :create]

  get 'leaderboard' => 'players#leaderboard'

  resources :players
end
