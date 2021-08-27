# frozen_string_literal: true

class Pet < ApplicationRecord
  has_and_belongs_to_many :orders, dependent: :destroy
  has_one_attached :photo
  belongs_to :owner

  validates :kind, presence: true
  validates :name, presence: true
  validates :height, presence: true, numericality: { only_integer: true }
  validates :weight, presence: true, numericality: { only_integer: true }
  validates :gender, presence: true
  validates :years, presence: true, numericality: { only_float: true }
  validates :description, length: { maximum: 300 }
end
