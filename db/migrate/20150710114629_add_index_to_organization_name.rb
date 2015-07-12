class AddIndexToOrganizationName < ActiveRecord::Migration
  def change
    add_index :organizations, :url, unique: true
  end
end
