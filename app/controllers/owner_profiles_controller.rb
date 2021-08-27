# frozen_string_literal: true

class OwnerProfilesController < ApplicationController
  def show
    @owner     = Owner.find(params[:id])
    @presenter = OwnerProfilePresenter.new(@owner, current_user)
  end

  def update
    @owner = Owner.find(params[:id])
    @owner.profile.update(edit_params)
      redirect_to(owner_path(current_user),
                  flash: { notice: 'Profile was updated!' })
  end

  protected

  def edit_params
    params
      .require(:profile)
      .permit(%i[first_name last_name phone description])
  end
end
