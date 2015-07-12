class CreateSiteSurveys < ActiveRecord::Migration
  def change
    create_table :site_surveys do |t|
      t.string :name
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.references :organzation_site, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
