# frozen_string_literal: true

class AddressesController < ApplicationController
  def index
    @addresses = current_user.addresses
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      redirect_to(owner_path(current_user),
                  flash: { notice: 'Address successfully added!' })
    else
      redirect_to(new_location_path(@address),
                  flash: { error: @address.errors.full_messages.to_sentence })
    end
  end

  def service_offering; end

  private

  def address_params
    params
      .require(:address)
      .permit(%i[country city zipcode address_line1 address_line2 user_id])
  end
end
