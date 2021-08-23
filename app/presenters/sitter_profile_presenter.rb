# frozen_string_literal: true

class SitterProfilePresenter
  def initialize(sitter, viewer)
    @sitter = sitter
    @viewer = viewer
  end

  def can_choose?
    viewer.type == Owner.name
  end

  def can_edit?
    viewer.id == sitter.id
  end

  def full_name
    sitter.profile.full_name
  end

  def price
    prices = sitter.availabilities.pluck(:cost).uniq

    if prices.size == 1
      "#{prices.last} $/day"
    else
      "#{prices.min} - #{prices.max} $/day"
    end
  end

  private

  attr_reader :viewer, :sitter
end
