class SyncLocationsWorker
  include Sidekiq::Worker
  #include Sidetiq::Schedulable

  #recurrence { hourly }

  def perform
    FoodTruck.pluck(:id).each do |truck_id|
      LocationWorker.perform_async(truck_id)
    end
  end
end
