
require 'rails_helper'
require 'webmock/rspec'

RSpec.describe ValorantCrawler, type: :service do
  let(:crawler) { described_class.new }

  before do
    # Configuração do WebMock para interceptar as requisições HTTP
    stub_request(:get, 'https://www.metasrc.com/valorant/stats/agents')
      .to_return(body: File.read('spec/fixtures/agent_stats.html'), status: 200)
  end

  describe '#crawl' do
    it 'extracts and saves champion data' do
      expect { crawler.crawl }.to change { Champion.count }.by(1)
    end
  end
end
