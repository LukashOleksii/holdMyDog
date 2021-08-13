# frozen_string_literal: true

class Availability < ApplicationRecord
  belongs_to :sitter
  has_many :timeslots
  has_many :orders
end
