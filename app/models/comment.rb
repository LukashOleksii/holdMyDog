# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :owner
  belongs_to :sitter
  belongs_to :order

  validates :body, presence: true, length: { maximum: 250 }
end
