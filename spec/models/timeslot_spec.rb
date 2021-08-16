require 'rails_helper'

RSpec.describe Timeslot, type: :model do
  context 'validations' do
    it { is_expected.to(validate_presence_of(:start_at)) }
    it { is_expected.to(validate_presence_of(:end_at)) }
  end
end
