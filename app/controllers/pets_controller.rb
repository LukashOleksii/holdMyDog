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

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy

    redirect_to(owner_path(current_user),
                flash: { notice: 'Pet was deleted!' })
  end

  def update
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      redirect_to(owner_path(current_user),
                  flash: { notice: 'Pet was updated!' })
    else
      redirect_back(fallback_location: owner_path(current_user))
    end
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to(owner_path(current_user),
                  flash: { notice: 'Pet successfully added!' })
    else
      redirect_back(fallback_location: owner_path(current_user))
    end
  end

  private

  def pet_params
    if params[:pet].present?
      params
        .require(:pet)
        .permit(%i[kind name gender years weight height description owner_id photo])
    else
      params
        .permit(%i[kind name gender years weight height description owner_id photo])
    end
  end
end
