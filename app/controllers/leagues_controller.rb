class LeaguesController < ApplicationController
  before_action :require_user, except: [:show]

  def show
    @league = League.find_by_slug(params[:slug])
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    user_league = LeagueCreator.new(@league, current_user)

    if user_league.save
      redirect_to @league
    else
      render :new
    end
  end

  private

  def league_params
    params.require(:league).permit(:name, :join_token)
  end
end
