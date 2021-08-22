# frozen_string_literal: true

class AddressController < ApplicationController
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
      redirect_to pets_path,
                  flash: { noice: 'Address successfully added!' }
    else
      redirect_to locations_path,
                  flash: { error: @address.errors.full_messages.to_sentence }
    end
  end

  private

  def address_params
    params.require(:address).permit(:country, :city, :zipcode, :address_line1, :address_line2, :user_id)
  end
end
