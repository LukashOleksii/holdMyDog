# frozen_string_literal: true

class Sitter < User
  has_one :profile, foreign_key: :user_id
  has_one :address
  has_one :availability

  has_many :orders
  has_many :comments
end
