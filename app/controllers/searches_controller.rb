# frozen_string_literal: true
class SearchesController < ApplicationController
  def index
    @start_at = params[:start_at]
    @end_at = params[:end_at]
    @city = params[:city]
    @types = {
        small_type: params[:small_type],
        medium_type: params[:medium_type],
        large_type: params[:large_type],
        giant_type: params[:giant_type]
    }.select{ |_type, value| value == 'true' }.keys
     .map{|type|[type, true]}
     .to_h

    @availabilities_ids = Availability.joins(sitter: :address)
                                      .where("availabilities.start_at <= ?", @start_at)
                                      .where("availabilities.end_at >= ?", @end_at)
                                      .where(addresses: { city: @city })
                                      .where(@types)
                                      .distinct
                                      .pluck("availabilities.id")

    def checktimeslots
      @timeslots_ids = []
      Availability.find(@availabilities_ids).each do |availability|
        @freetime = true
        availability.timeslots.each do |timeslot|
            if @start_at.between?(timeslot.start_at, timeslot.end_at) || 
                 @end_at.between?(timeslot.start_at, timeslot.end_at) || 
                 timeslot.start_at.between?(@start_at, @end_at) || 
                 timeslot.end_at.between?(@start_at, @end_at)

              @freetime = false
            end
        end
        if @freetime
            @timeslots_ids.push(availability.id)
        end
      end
      @timeslots_ids = @timeslots_ids.uniq
      Availability.find(@timeslots_ids)
    end
    @result = checktimeslots
  end
end
