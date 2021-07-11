class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_enum :user_type, %w[admin operator]

    create_table :users do |t|
      t.string :name
      t.string :email, index: { unique: true }
      t.text :password_digest
      t.enum :user_type, enum_name: :user_type, index: true

      t.timestamps
    end
  end
end
