class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.references :organization
      t.string :plate

      t.timestamps
    end
  end
end
