class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.references :shop, null: false, foreign_key: true
      t.float :price
      t.string :category_name
      t.string :sub_category_name
      t.string :description

      t.timestamps
    end
  end
end
