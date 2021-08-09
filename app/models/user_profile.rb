# frozen_string_literal: true

class UserProfile < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :surname, presence: true
  validates :phone, presence: true, length: { is: 10 }
end
