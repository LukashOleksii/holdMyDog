# frozen_string_literal: true

class Pet < ApplicationRecord
  has_and_belongs_to_many :orders

  belongs_to :owner
end
