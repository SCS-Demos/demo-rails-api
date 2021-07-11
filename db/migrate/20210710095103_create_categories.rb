class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.text :name
      t.bigint :products_count

      t.timestamps
    end
  end
end
