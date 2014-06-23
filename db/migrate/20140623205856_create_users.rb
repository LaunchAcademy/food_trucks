class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      # TODO null: false (and change truck show page tests)
      t.string :name
      t.string :email

      # TODO this will be an actual file later; null okay for now
      t.string :picture_url

      # TODO will expand on admin vs. user later; null okay for now
      t.string :role
      t.timestamps
    end
  end
end
