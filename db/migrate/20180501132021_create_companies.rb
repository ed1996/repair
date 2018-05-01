class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :category_artisan
      t.text :summary
      t.string :address
      t.integer :phone
      t.integer :siret
      t.integer :price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
