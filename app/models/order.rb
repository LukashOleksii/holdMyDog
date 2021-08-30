# frozen_string_literal: true

class Order < ApplicationRecord
  has_and_belongs_to_many :pets, dependent: :destroy

  belongs_to :timeslot, dependent: :destroy
  belongs_to :owner
  belongs_to :sitter
  belongs_to :availability

  validates :status, presence: true
  validates :capacity, presence: true
  validate :dog_type_present?
  validates :cost, presence: true, numericality: { only_integer: true }
  validates :description, length: { maximum: 300 }

  def dog_type_present?
    return if small_type || medium_type || large_type || giant_type

    errors.add(:base, 'at least one of dog type must be present')
  end
end
