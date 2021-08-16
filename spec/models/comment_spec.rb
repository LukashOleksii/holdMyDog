require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    it { is_expected.to(validate_presence_of(:body)) }
    it { is_expected.to(validate_length_of(:body).is_at_most(250)) }
  end
end
