class FoodTrucksWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily } 

  def perform
    FoodTrucks::FetchTrucks.call()
  end
end
