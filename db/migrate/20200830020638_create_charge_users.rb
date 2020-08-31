class CreateChargeUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :charge_users do |t|
      t.string :url
      t.integer :created_by
      t.date :month

      t.timestamps
    end
  end
end
