# frozen_string_literal: true

class Sitter < User
  has_one :address
  has_many :availabilities

  has_many :orders
  has_many :comments

  def price
    prices = self.availabilities.pluck(:cost).uniq

    if prices.size == 1
      "#{prices.last} $/day"
    else
      "#{prices.min} - #{prices.max} $/day"
    end
  end

end
