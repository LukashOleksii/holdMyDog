# frozen_string_literal: true

class Timeslot < ApplicationRecord
  has_one    :order
  belongs_to :availability

  validates :start_at, presence: true
  validates :end_at, presence: true
end
