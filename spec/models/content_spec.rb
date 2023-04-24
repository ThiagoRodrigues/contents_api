# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Content, type: :model do
  describe 'attributes' do
    it { is_expected.to respond_to(:order) }
    it { is_expected.to respond_to(:title) }
    it { is_expected.to respond_to(:original_title) }
    it { is_expected.to respond_to(:year) }
    it { is_expected.to respond_to(:type) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:original_title) }
    it { is_expected.to validate_presence_of(:year) }
  end
end
