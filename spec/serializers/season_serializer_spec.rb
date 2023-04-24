# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SeasonSerializer, type: :serializer do
  let(:episodes) { build_stubbed_list(:episode, 2) }
  let(:season) { build_stubbed(:season, episodes: episodes) }
  let(:serializer) { SeasonSerializer.new(season) }

  subject(:serialization) { serializer.serializable_hash }

  describe 'attributes' do
    it 'includes the expected attributes' do
      expect(serialization).to include(:id, :number, :episodes)
    end
  end

  describe 'associations' do
    it 'includes :episodes association with EpisodeSerializer' do
      expect(serialization[:episodes]).not_to be_nil
      expect(serialization[:episodes].size).to eq(2)
    end
  end
end
