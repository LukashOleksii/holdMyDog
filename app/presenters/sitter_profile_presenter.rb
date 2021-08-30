# frozen_string_literal: true

class SitterProfilePresenter
  def initialize(sitter, viewer)
    @sitter = sitter
    @viewer = viewer
  end

  def can_choose?
    viewer.type == Owner.name
  end

  def can_comment?
    viewer.id != sitter.id &&
      Order.find_by(owner: viewer, sitter: sitter)
  end

  def can_edit?
    viewer.id == sitter.id
  end

  def profile
    sitter.profile
  end

  def full_name
    sitter.profile.full_name
  end

  def description 
    sitter.profile.description
  end

  def availabilities
    sitter.availabilities.order(start_at: :asc)
  end

  def phone
    sitter.profile.phone
  end

  def photo
    sitter.profile.photo
  end

  def comments
    sitter.received_comments.order(created_at: :desc)
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
