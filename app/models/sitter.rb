# frozen_string_literal: true

class Sitter < User
  has_one :profile
  has_one :address
  has_one :availability
  has_many :orders
  has_many :comments
end
