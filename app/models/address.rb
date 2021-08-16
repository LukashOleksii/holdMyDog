# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :owner
  belongs_to :sitter
  belongs_to :admin

  validates :country, presence: true
  validates :city, presence: true
  validates :address_line1, presence: true
  validates :zipcode, presence: true
end
