class FoodTrucksWorker
  include Sidekiq::Worker

  def perform
    FoodTrucks::FetchTrucks.call()
  end
end
