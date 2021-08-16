require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'validations' do
    it { is_expected.to(validate_presence_of(:country)) }
    it { is_expected.to(validate_presence_of(:city)) }
    it { is_expected.to(validate_presence_of(:address_line1)) }
    it { is_expected.to(validate_presence_of(:zipcode)) }
  end
end
