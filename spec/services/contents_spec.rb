# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contents, type: :service do
  describe '#call' do
    let!(:movie) { create(:movie) }
    let!(:tv_show) { create(:tv_show) }

    subject(:call) { described_class.new(content_type).call }

    context 'when content_type is present' do
      context 'and content_type is tv_show' do
        let(:content_type) { 'tv_show' }

        it 'returns contents' do
          expect(call).to match_array([tv_show])
        end
      end

      context 'and content_type is movie' do
        let(:content_type) { 'movie' }

        it 'returns contents' do
          expect(call).to match_array([movie])
        end
      end

      context 'and content_type is not valid' do
        let(:content_type) { 'ivalid' }

        it 'returns empty' do
          expect(call).to be_empty
        end
      end
    end

    context 'when content_type is not present' do
      let(:content_type) { }

      it 'returns empty' do
        expect(call).to match_array([tv_show, movie])
      end
    end
  end
end
