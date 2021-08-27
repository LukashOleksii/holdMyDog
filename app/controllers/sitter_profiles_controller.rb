# frozen_string_literal: true

class SitterProfilesController < ApplicationController
  def show
    @sitter    = Sitter.find(params[:id])
    @presenter = SitterProfilePresenter.new(@sitter, current_user)
  end

  def update
    @sitter = Sitter.find(params[:id])
    @sitter.profile.update(edit_params)
      redirect_to(sitter_path(current_user),
                  flash: { notice: 'Profile was updated!' })
  end

  protected

  def edit_params
    params
      .require(:profile)
      .permit(%i[first_name last_name phone description])
  end
end
