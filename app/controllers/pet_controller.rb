# frozen_string_literal: true

class PetController < ApplicationController
  def add
    # @pet = Pet.new(pet_params)

    # if @pet.save
    #   redirect_to location_path,
    #               flash: { noice: 'Pet successfully added!' }
    # else
    #   redirect_to pet_path,
    #               flash: { error: @pet.errors.full_messages.to_sentence }
    # end
  end

  def skip
    #redirect_to location_path
  end

  private

  def pet_params
    #params.require(:pet).permit(:type, :name, :gender, :years, :weight, :height, :description, :owner_id)
  end
end
