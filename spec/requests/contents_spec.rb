# frozen_string_literal: true

require 'rails_helper'

include Requests::JsonHelpers

RSpec.describe 'Contents', type: :request do
  describe '/GET api/v1/contents/' do
    let!(:movie) { create(:movie) }
    let!(:tv_show) { create(:tv_show) }

    before { get api_v1_contents_path, params: { content_type: content_type } }

    context 'when content_type is present' do
      context 'and content_type is tv_show' do
        let(:content_type) { 'tv_show' }

        it 'returns contents' do
          expect(json).not_to be_empty
          expect(json.size).to eq(1)
          json.all? { |content| expect(content['type']).to eq('TvShow') }
        end

        it 'returns status code :ok' do
          expect(response).to have_http_status(:ok)
        end
      end

      context 'and content_type is movie' do
        let(:content_type) { 'movie' }

        it 'returns contents' do
          expect(json).not_to be_empty
          expect(json.size).to eq(1)
          json.all? { |content| expect(content['type']).to eq('Movie') }
        end

        it 'returns status code :ok' do
          expect(response).to have_http_status(:ok)
        end
      end

      context 'and content_type is not valid' do
        let(:content_type) { 'invalid' }

        it 'returns empty collection' do
          expect(json).to be_empty
        end

        it 'returns status code :ok' do
          expect(response).to have_http_status(:ok)
        end
      end
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
