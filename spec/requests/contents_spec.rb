# frozen_string_literal: true

require 'rails_helper'

include Requests::JsonHelpers

RSpec.describe 'Contents', type: :request do
  describe '/GET api/v1/contents/' do
    # let!(:contents) { create_list(:content, 2, :with_seasons) }
    let!(:movie) { create(:movie) }
    let!(:tv_show) { create(:tv_show) }

    let(:content_type) { 'TvShow' }


    before { get api_v1_contents_path, params: { content_type: content_type } }

    it 'returns contents' do
      expect(json).not_to be_empty
      expect(json.size).to eq(2)
    end

    it 'returns status code :ok' do
      expect(response).to have_http_status(:ok)
    end

    context 'when content_type is not present' do
      let(:content_type) { nil }

      it 'returns contents' do
        expect(json).not_to be_empty
        expect(json.size).to eq(2)
      end

      it 'returns status code :ok' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
