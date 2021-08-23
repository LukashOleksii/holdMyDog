# frozen_string_literal: true

class SitterProfilesController < ApplicationController
  def show
    @sitter    = Sitter.find(params[:id])
    @presenter = SitterProfilePresenter.new(@sitter, current_user)
  end
end
