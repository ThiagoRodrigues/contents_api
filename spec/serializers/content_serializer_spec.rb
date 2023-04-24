# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContentSerializer, type: :serializer do
  let(:seasons) { build_stubbed_list(:season, 2) }
  let(:content) { build_stubbed(:tv_show, seasons: seasons) }
  let(:serializer) { ContentSerializer.new(content) }

  subject(:serialization) { serializer.serializable_hash }

  context 'when object is a TvShow' do
    it 'includes the expected attributes' do
      expect(serialization).to include(:id, :title, :original_title, :year, :type, :order)
    end

    it 'includes :seasons association with SeasonSerializer' do
      expect(serialization[:seasons]).to be_present
      expect(serialization[:seasons].first).to be_a(Hash)
      expect(serialization[:seasons].first.keys).to include(:id, :number)
    end
  end

  context 'when object is a Movie' do
    let(:content) { build_stubbed(:movie) }

    it 'includes the expected attributes' do
      expect(serialization).to include(:id, :title, :original_title, :year, :type, :order)
    end

    it 'does not include :seasons association with SeasonSerializer' do
      expect(serialization[:seasons]).to be_blank
    end
  end
end
