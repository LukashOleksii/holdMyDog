require 'rails_helper'

RSpec.describe Owner, type: :model do
  context 'validations' do
    it { is_expected.to(validate_presence_of(:email)) }
    it { is_expected.to(validate_uniqueness_of(:email).case_insensitive) }
    it { should_not allow_value("test@test").for(:email) }
  end
end
