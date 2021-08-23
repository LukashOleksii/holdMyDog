# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :user

  validates :country,       presence: true
  validates :city,          presence: true
  validates :zipcode,       presence: true
  validates :address_line1, presence: true
end
