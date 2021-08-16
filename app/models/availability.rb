# frozen_string_literal: true

class Availability < ApplicationRecord
  belongs_to :sitter
  has_many :timeslots
  has_many :orders

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :status, presence: true
  validates :cost, presence: true, numericality: { only_integer: true }
  validates :height, presence: true, numericality: { only_integer: true }
  validates :weight, presence: true, numericality: { only_integer: true }
end
