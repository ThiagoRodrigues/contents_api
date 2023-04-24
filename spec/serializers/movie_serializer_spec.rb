# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MovieSerializer, type: :serializer do
  let(:movie) { build_stubbed(:movie) }
  let(:serializer) { MovieSerializer.new(movie) }

  subject(:serialization) { serializer.serializable_hash }

  describe 'attributes' do
    it 'includes the expected attributes' do
      expect(serialization).to include(:id, :title, :original_title, :year, :type, :order)
    end
  end
end
