# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TvShowSerializer, type: :serializer do
  let(:seasons) { build_stubbed_list(:season, 2) }
  let(:tv_show) { build_stubbed(:tv_show, seasons: seasons) }
  let(:serializer) { TvShowSerializer.new(tv_show) }

  let(:serialization) { serializer.serializable_hash }

  describe 'attributes' do
    it 'includes the expected attributes' do
      expect(serialization).to include(:id, :title, :original_title, :year, :type, :order, :seasons)
    end
  end

  describe 'associations' do
    it 'includes :seasons association with Seasonserializer' do
      expect(serialization[:seasons]).not_to be_nil
      expect(serialization[:seasons].size).to eq(2)
    end
  end
end
