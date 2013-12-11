class CreateHoursPackages < ActiveRecord::Migration
  def change
    create_table :hours_packages do |t|
      t.integer :amount
      t.text :weekly_hours
      t.references :pupil
      t.references :teacher

      t.timestamps
    end
  end
end
