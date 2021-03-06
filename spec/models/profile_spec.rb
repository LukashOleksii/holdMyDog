require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'validations' do
    it { is_expected.to(validate_presence_of(:first_name)) }
    it { is_expected.to(validate_presence_of(:last_name)) }
    it { is_expected.to(validate_presence_of(:phone)) }
    it { is_expected.to(validate_length_of(:description).is_at_most(300)) }
  end
end
