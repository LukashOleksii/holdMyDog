# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :owner
  belongs_to :sitter
  belongs_to :admin

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
  validates :description, length: { maximum: 300 }
end
