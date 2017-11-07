class LeagueCreator
  attr_reader :league, :user

  def initialize(league, user)
    @league = league
    @user = user
  end

  def save
    if league.save
      league.user_leagues.create(user_id: user.id, role: 1)
      return true
    end
    return false
  end
end
