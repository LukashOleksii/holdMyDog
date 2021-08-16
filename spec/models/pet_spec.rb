require 'rails_helper'

RSpec.describe Pet, type: :model do
  context 'validations' do
    it { is_expected.to(validate_presence_of(:type)) }
    it { is_expected.to(validate_presence_of(:name)) }
    it { is_expected.to(validate_presence_of(:height)) }
    it { is_expected.to(validate_numericality_of(:height)) }
    it { is_expected.to(validate_presence_of(:weight)) }
    it { is_expected.to(validate_numericality_of(:weight)) }
    it { is_expected.to(validate_presence_of(:gender)) }
    it { is_expected.to(validate_presence_of(:years)) }
    it { is_expected.to(validate_numericality_of(:years)) }
    it { is_expected.to(validate_length_of(:description).is_at_most(300)) }
  end
end
