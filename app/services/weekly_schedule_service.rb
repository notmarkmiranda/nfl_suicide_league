require 'net/http'
require 'uri'

class WeeklyScheduleService
  attr_reader :xml

  def initialize(season:, type:, week:)
    uri = URI.parse("http://www.nfl.com/ajax/scorestrip?season=#{season}&seasonType=#{type}&week=#{week}")
    @xml = Net::HTTP.get(uri)
  end

  def parsed_xml
    base_hash = Hash.from_xml(xml)["ss"]
    return if base_hash.nil?
    symbolized_hash(base_hash["gms"]["g"])
  end

  private

  def symbolized_hash(hash)
    hash.map do |game|
      game.symbolize_keys
    end
  end
end
