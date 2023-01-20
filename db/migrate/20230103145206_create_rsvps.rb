class CreateRsvps < ActiveRecord::Migration[7.0]
  def change
    create_table :rsvps do |t|
      t.string :name
      t.string :food_requests
      t.string :accomodation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
