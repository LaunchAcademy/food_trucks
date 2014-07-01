class FoodTrucksWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { hourly } #can be specified to different times, check gem docs

  def perform
    FoodTrucks::FetchTrucks.call()
  end
end
