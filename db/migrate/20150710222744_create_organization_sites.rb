class CreateOrganizationSites < ActiveRecord::Migration
  def change
    create_table :organization_sites do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.references :organization, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
