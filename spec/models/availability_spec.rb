require 'rails_helper'

RSpec.describe Availability, type: :model do
  context 'validations' do
    it { is_expected.to(validate_presence_of(:start_at)) }
    it { is_expected.to(validate_presence_of(:end_at)) }
    it { is_expected.to(validate_presence_of(:status)) }
    it { is_expected.to(validate_presence_of(:cost)) }
    it { is_expected.to(validate_numericality_of(:cost)) }
    it { is_expected.to(validate_presence_of(:height)) }
    it { is_expected.to(validate_numericality_of(:height)) }
    it { is_expected.to(validate_presence_of(:weight)) }
    it { is_expected.to(validate_numericality_of(:weight)) }
  end
end
