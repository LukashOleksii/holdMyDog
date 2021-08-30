# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :comments, dependent: :nullify 
  has_and_belongs_to_many :pets, dependent: :destroy

  belongs_to :timeslot
  belongs_to :owner
  belongs_to :sitter
  belongs_to :availability

  validates :status, presence: true
  validates :capacity, presence: true
  validates :cost, presence: true, numericality: { only_integer: true }
  validates :description, length: { maximum: 300 }
end
