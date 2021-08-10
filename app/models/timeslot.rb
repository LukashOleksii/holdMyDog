# frozen_string_literal: true

class Timeslot < ApplicationRecord
  has_one :order
  has_many :applications
  belongs_to :sitter
end
