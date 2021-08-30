# frozen_string_literal: true

class Sitter < User
  has_many :availabilities
  has_many :orders
end
