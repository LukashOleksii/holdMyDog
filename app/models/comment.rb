# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :author,   class_name: User.name, foreign_key: :author_id
  belongs_to :receiver, class_name: User.name, foreign_key: :receiver_id
  belongs_to :order

  validates :body, presence: true, length: { maximum: 250 }
end
