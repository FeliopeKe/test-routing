class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.references :organization
      t.references :driver
      t.references :vehicle

      t.string :name
      t.string :aasm_state
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :travel_time
      t.integer :total_stops
      t.string :actions

      t.timestamps
    end
  end
end
