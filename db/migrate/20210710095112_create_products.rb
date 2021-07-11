class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.references :category, index: true, foreign_key: true
      t.string :name
      t.decimal :price, precision: 8, scale: 2, default: 0

      t.timestamps
    end
  end
end
