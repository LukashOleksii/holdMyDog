namespace :update_status do
  task status_done: :environment do
    @timeslots = Timeslot.where(end_at: Date.yesterday)
    @timeslots.each do |timeslot|
      Order.find_by(timeslot_id: timeslot.id).update(status: "Done")
    end
  end

  task status_archived: :environment do
    Order.where(status: "Done", updated_at: Date.today - 7.days).update_all(status: "Archived")
  end
end
