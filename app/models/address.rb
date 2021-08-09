# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user

  validates :country, presence: true
  validates :city, presence: true
  validates :region, presence: true
  validates :street, presence: true
end
