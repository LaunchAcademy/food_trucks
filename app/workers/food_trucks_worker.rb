class FoodTrucksWorker
  include Sidekiq::Worker

  def perform
    Trucks::FetchTrucks.call()
  end
end
