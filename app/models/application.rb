# frozen_string_literal: true

class Application < ApplicationRecord
  has_many :comments
  has_and_belongs_to_many :pets

  belongs_to :timeslot
  belongs_to :owner
  belongs_to :sitter
end
