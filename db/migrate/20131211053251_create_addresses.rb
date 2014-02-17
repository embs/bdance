class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :street
      t.integer :number
      t.string :district
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
