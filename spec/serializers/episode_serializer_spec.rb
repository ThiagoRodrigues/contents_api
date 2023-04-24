# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EpisodeSerializer, type: :serializer do
  let(:episode) { build_stubbed(:episode) }
  let(:serializer) { EpisodeSerializer.new(episode) }

  subject(:serialization) { serializer.serializable_hash }

  describe 'attributes' do
    it 'includes the expected attributes' do
      expect(serialization).to include(:id, :number)
    end
  end
end
