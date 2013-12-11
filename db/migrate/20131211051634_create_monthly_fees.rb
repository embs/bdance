class CreateMonthlyFees < ActiveRecord::Migration
  def change
    create_table :monthly_fees do |t|
      t.float :amount
      t.date :due_date
      t.references :pupil

      t.timestamps
    end
  end
end
