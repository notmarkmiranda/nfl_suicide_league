class PicksController < ApplicationController
  before_action :verify_membership
  before_action :league, only: [:show]

  def show
    @pick = Pick.find(params[:id])
  end

  def new
    @week = Season.current.current_week
  end

  def create
    @pick = Pick.new(pick_params)
    if @pick.save
      redirect_to league_pick_path(league, @pick)
    else
      render :new
    end
  end

  private

  def verify_membership
    redirect_to root_path if user_league.nil?
  end

  def league
    @league ||= League.find_by_slug(params[:league_slug])
  end

  def pick_params
    params.require(:pick).permit(:team_id, :game_id).merge(user_league_id: user_league.id)
  end

  def user_league
    @user_league ||= UserLeague.find_by(user_id: current_user.id, league_id: league.id)
  end
end
