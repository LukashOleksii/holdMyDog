# frozen_string_literal: true

class Timeslot < ApplicationRecord
  has_one    :order
  belongs_to :availability
end
