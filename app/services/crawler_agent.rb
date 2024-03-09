require 'nokogiri'
require 'httparty'

class ValorantCrawler
  def initialize
    @url = 'https://www.metasrc.com/valorant/stats/agents'
  end

  def crawl
    response = HTTParty.get(@url)
    parse_html(response.body)
  end

  private

  def parse_html(html)
    Champion.delete_all 
    ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='champions'")


    doc = Nokogiri::HTML(html)
    table_rows = doc.css('div#table-scroll table.stats-table tbody tr')

    table_rows.each do |row|
      agent_name = row.at('td:nth-child(1) span:first-child').text.strip
      win_rate = row.at('td:nth-child(6)').text.strip
      pick_rate = row.at('td:nth-child(7)').text.strip

      puts "Agent: #{agent_name}"
      puts "Win Rate: #{win_rate}"
      puts "Pick Rate: #{pick_rate}"
      puts "---"

      Champion.create(name: agent_name, winrate: win_rate.to_f, pickrate: pick_rate.to_f)
    end
  end
end
