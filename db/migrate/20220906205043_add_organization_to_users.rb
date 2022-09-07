class AddOrganizationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :organization
  end
end
