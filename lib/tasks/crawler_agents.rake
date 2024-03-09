namespace :crawler do
  desc 'Run Valorant Crawler'
  task run: :environment do

    require_relative '../../app/services/crawler_agent'
    ValorantCrawler.new.crawl
  end
end
