# frozen_string_literal: true

class OrdersController < ApplicationController
  def index
    @orders    = current_user.orders
    @presenter = OrderPresenter.new(current_user)
  end

  def create
    @timeslot = Timeslot.new(timeslot_params)
    if @timeslot.save
      @order = Order.new(order_params.merge(timeslot: @timeslot, cost: total_price(price_params)))

      if @order.save
        redirect_to(sitter_path(order_params[:sitter_id]),
                    flash: { notice: 'order successfully created!' })
      else
        redirect_back(fallback_location: sitter_path(order_params[:sitter_id]))
      end
    else
      redirect_back(fallback_location: sitter_path(order_params[:sitter_id]))
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    redirect_to(inbox_path(current_user),
                flash: { notice: 'Order was deleted!' })
  end

  def confirm_order
    @order = Order.find(params[:id])

    if @order.update(status: 'Active')
      redirect_to(inbox_path(current_user),
                  flash: { notice: 'Order was updated!' })
    else
      redirect_back(fallback_location: inbox_path(current_user))
    end
  end

  def cancel_order
    @order    = Order.find(params[:id])
    @timeslot = Timeslot.find(@order.timeslot_id)
    if @timeslot.update(order_status: false)
      if @order.update(status: 'Canceled')
        redirect_to(inbox_path(current_user),
                    flash: { notice: 'Order was updated!' })
      else
        redirect_back(fallback_location: inbox_path(current_user))
      end
    else
      redirect_back(fallback_location: inbox_path(current_user))
    end
  end

  protected

  def order_params
    params
      .require(:availability)
      .permit(%i[status cost description availability_id
                 timeslot_id owner_id sitter_id capacity
                 small_type medium_type large_type giant_type ])
  end

  def timeslot_params
    params
      .require(:availability)
      .permit(%i[availability_id start_at end_at order_status])
  end

  def price_params
    params
      .require(:availability)
      .permit(%i[start_at end_at cost capacity])
  end

  def total_price(price_params)
    days = (price_params[:end_at].to_date - price_params[:start_at].to_date).to_i
    days * price_params[:cost].to_i * price_params[:capacity].to_i
  end
end
