# frozen_string_literal: true

class SitterProfilesController < ApplicationController
  def show
    @sitter = Sitter.find(params[:id])
    @can_edit = current_user.id == @sitter.id

  end
end
