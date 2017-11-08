week_2 = WeeklyScheduleService.new(season: 2017, type: 'REG', week: 2)

week_2.parsed_xml.each do |g|
  team_1 = Team.find_or_create_by(abbreviation: g[:h], name: g[:hnn])
  team_2 = Team.find_or_create_by(abbreviation: g[:v], name: g[:vnn])
  puts "#{team_1.name.capitalize}!"
  puts "#{team_2.name.capitalize}!"
end

puts "All #{Team.count} teams created in the database!"


puts "Importing 2017 Season"

season = Season.find_or_create_by(year: '2017')

[*1..17].each do |n|
  week = WeeklyScheduleService.new(season: 2017, type: 'REG', week: n)
  week_object = Week.find_or_create_by(season_id: season.id, number: n, start_date: Date.today, end_date: Date.today)

  puts "week: #{week_object.number}"
  games = week.parsed_xml.map do |g|
    home_team = Team.find_by!(abbreviation: g[:h], name: g[:hnn])
    away_team = Team.find_by!(abbreviation: g[:v], name: g[:vnn])
    date = DateTime.strptime("#{g[:eid][0..-3]} #{g[:t]} -0500", '%Y%m%d %H:%M %Z')
    game = Game.find_or_initialize_by(start: date, home_id: home_team.id, away_id: away_team.id, week_id: week_object.id)
    game.h_score = g[:hs] unless g[:hs].blank?
    game.a_score = g[:vs] unless g[:vs].blank?
    game.completed = g[:q].starts_with?("F")
    game.save!
    puts "#{away_team.abbreviation} at #{home_team.abbreviation}"
    game
  end
  end_date = games.max_by(&:start).start
  start_date = end_date - (60 * 60 * 24 * 7)
  week_object.update(start_date: start_date, end_date: end_date)
end
