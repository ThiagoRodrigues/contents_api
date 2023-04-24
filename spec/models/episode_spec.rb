# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Episode, type: :model do
  describe 'attributes' do
    it { is_expected.to respond_to(:number) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:season) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:number) }
  end

end
