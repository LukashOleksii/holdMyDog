# frozen_string_literal: true

class OrderPresenter
  def initialize(viewer)
    @viewer = viewer
  end

  def orders
    @viewer.orders.order(created_at: :desc)
  end

  def timeslot(order)
    time = Timeslot.find_by(order: order)

    "#{time.start_at.strftime('%d/%m/%Y')} - #{time.end_at.strftime('%d/%m/%Y')}"
  end

  def sitter_profile(order)
    @sitter_profile ||= Profile.find_by(user_id: order.sitter_id)
  end

  def owner_profile(order)
    @owner_profile ||= Profile.find_by(user_id: order.owner_id)
  end

  def sitter_address(order)
    @sitter_address ||= Address.find_by(user_id: order.sitter_id)
  end

  def owner_address(order)
    @owner_address ||= Address.find_by(user_id: order.owner_id)
  end

  def pet_types(order)
    str = ''
    str = order.small_type ? "#{str}Small " : str.to_s
    str = order.medium_type ? "#{str}Medium " : str.to_s
    str = order.large_type ? "#{str}Large " : str.to_s
    order.giant_type ? "#{str}Giant" : str.to_s
  end

  private

  attr_reader :viewer
end
