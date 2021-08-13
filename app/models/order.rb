# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :comments
  has_and_belongs_to_many :pets

  belongs_to :timeslot
  belongs_to :owner
  belongs_to :sitter
  belongs_to :availability
end
