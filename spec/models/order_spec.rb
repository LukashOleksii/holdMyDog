require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'validations' do
    it { is_expected.to(validate_presence_of(:status)) }
    it { is_expected.to(validate_presence_of(:cost)) }
    it { is_expected.to(validate_numericality_of(:cost)) }
    it { is_expected.to(validate_length_of(:description).is_at_most(300)) }
  end
end
