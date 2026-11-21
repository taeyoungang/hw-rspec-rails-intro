require 'rails_helper'
require 'spec_helper'

describe Movie do
  describe 'searching TMDB by keyword' do
    it 'calls Faraday gem with NYU domain' do
        expect(Faraday).to receive(:get).with('https://nyu.edu')
        Movie.find_in_tmdb_2('https://nyu.edu')
    end
    it 'calls TMDb with valid API key' do
        Movie.find_in_tmdb({title: "hacker", language: "en"})
    end
  end
end