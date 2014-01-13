class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :kind
      t.integer :ddd
      t.integer :number
      t.string :provider
      t.references :user

      t.timestamps
    end
  end
end
