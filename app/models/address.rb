# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :owner
  belongs_to :sitter
  belongs_to :admin
end
