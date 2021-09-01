# frozen_string_literal: true

class Availability < ApplicationRecord
  belongs_to :sitter
  has_many :timeslots, dependent: :destroy
  has_many :orders

  validate :dog_type_present?
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :cost, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :capacity, presence: true, numericality: { greater_than: 0, only_integer: true }

  def dog_type_present?
    return if small_type || medium_type || large_type || giant_type

    errors.add(:base, 'At least one of dog type must be present')
  end
end
