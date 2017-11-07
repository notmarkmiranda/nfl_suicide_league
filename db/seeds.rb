week_2 = WeeklyScheduleService.new(season: 2017, type: 'REG', week: 2)

week_2.parsed_xml.each do |g|
  team_1 = Team.find_or_create_by(abbreviation: g[:h], name: g[:hnn])
  team_2 = Team.find_or_create_by(abbreviation: g[:v], name: g[:vnn])
  puts "#{team_1.name.capitalize}!"
  puts "#{team_2.name.capitalize}!"
end

puts "All #{Team.count} teams created in the database!"


puts "Importing 2017 Season"

