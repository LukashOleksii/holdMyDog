# frozen_string_literal: true

class Owner < User
  has_many :orders
  has_many :pets
  has_many :comments
end
