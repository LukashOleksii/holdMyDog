# frozen_string_literal: true

class Sitter < User
  has_one :profile
  has_one :address
  has_many :orders
  has_many :timeslots
  has_many :comments
  has_many :raitings
end
