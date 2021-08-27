# frozen_string_literal: true

class AvailiabilitiesController < ApplicationController
  def index
    @availabilities = current_user.availabilities
  end

  def show
    @availability = Availability.find(params[:id])
  end

  def new
    @availability = Availability.new
  end

  def create
    @availability = Availability.new(availability_params)

    if @availability.save
      redirect_to(sitter_path(current_user),
                  flash: { notice: "availability successfully added!" })
    else
      redirect_back(fallback_location: sitter_path(current_user))
    end
  end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy

    redirect_to(sitter_path(current_user),
                flash: { notice: 'Availability was deleted!' })
  end

  private

  def availability_params
    if params[:availability].present?
      params
      .require(:availability)
      .permit(%i[status start_at end_at cost capacity small_type medium_type large_type giant_type sitter_id])
    else
      params
      .permit(%i[status start_at end_at cost capacity small_type medium_type large_type giant_type sitter_id])
    end
    
  end
end
