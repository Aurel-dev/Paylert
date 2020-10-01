class CreateStrigowls < ActiveRecord::Migration[6.0]
  def change
    create_table :strigowls do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.float :bidding_price
      t.string :status
      t.date :finished_at

      t.timestamps
    end
  end
end
