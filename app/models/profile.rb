# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :phone,      presence: true
  validates :description, length: { maximum: 300 }

  def full_name
    "#{first_name} #{last_name}"
  end
end
