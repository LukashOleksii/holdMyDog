# frozen_string_literal: true

class Admin < User
  has_one :profile, foreign_key: :user_id
end
