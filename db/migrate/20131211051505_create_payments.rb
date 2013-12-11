class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.datetime :date
      t.references :monthly_fee
      t.references :pupil

      t.timestamps
    end
  end
end
