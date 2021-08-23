# frozen_string_literal: true

class PetsController < ApplicationController
  def index
    @pets = current_user.pets
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to(new_location_path,
                  flash: { notice: 'Pet successfully added!' })
    else
      redirect_to(pets_path(@pet),
                  flash: { error: @pet.errors.full_messages.to_sentence })
    end
  end

  private

  def pet_params
    params
      .require(:pet)
      .permit(%i[kind name gender years weight height description owner_id])
  end
end
