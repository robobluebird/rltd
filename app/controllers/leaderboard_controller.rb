class LeaderboardController < ApplicationController
  # GET /leaderboards
  # GET /leaderboards.xml
  def index
    @leaders = User.order_by([:points,:desc]).limit(3)
  end
end
