class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :street
      t.string :zip_code
      t.string :district
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
